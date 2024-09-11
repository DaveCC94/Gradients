//
//  SwiftDataListProviderTests.swift
//  GroceryListFeatureTests
//
//  Created by David Castro Cisneros on 10/09/24.
//

import GroceryListFeature
import SwiftData
import XCTest

final class SwiftDataListProviderTests: XCTestCase {
    func test_init_doesNotInitializeItems() async {
        let sut = await makeSUT(modelContext: FakeModelContext())
        XCTAssertTrue(sut.list.isEmpty)
    }
    
    func test_add_pushesAtTheEnd() async {
        let sut = await makeSUT(modelContext: FakeModelContext())
        
        let item1 = fixtureGroceryItem("1")
        let item2 = fixtureGroceryItem("2")
        
        sut.add(fixtureGroceryItem(item1.name))
        sut.add(fixtureGroceryItem(item2.name))
        
        XCTAssertEqual(sut.list, [item1, item2])
    }
    
    func test_removeAt_especifiedIndex() async {
        let sut = await makeSUT(modelContext: FakeModelContext())
        
        let item1 = fixtureGroceryItem("1")
        let item2 = fixtureGroceryItem("2")
        
        sut.add(fixtureGroceryItem(item1.name))
        sut.add(fixtureGroceryItem(item2.name))
        
        sut.remove(at: 1)
        
        XCTAssertEqual(sut.list, [item1])
    }
    
    // MARK: - Helpers
    
    private func makeSUT(modelContext: ModelContextProtocol, file: StaticString = #filePath, line: UInt = #line) -> SwiftDataListProvider {
        let sut = SwiftDataListProvider(modelContext: modelContext)
        
        trackForMemoryLeaks(sut, file: file, line: line)
        
        return sut
    }

    final class FakeModelContext: ModelContextProtocol {
        var items: [ManagedGroceryItem] = []
        var context: ModelContext
        
        @MainActor
        init() async {
            let container = try! ModelContainer(for: ManagedGroceryItem.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
            context = container.mainContext
        }
        
        func fetch<T>(_ descriptor: FetchDescriptor<T>) throws -> [T] where T: ManagedGroceryItem {
            let descriptor = FetchDescriptor<ManagedGroceryItem>(sortBy: [SortDescriptor(\.name)])
            return try context.fetch(descriptor) as! [T]
        }
        
        func insert<T>(_ item: T) where T: ManagedGroceryItem {
            context.insert(item)
        }
        
        func delete<T>(_ item: T) where T: ManagedGroceryItem {
            context.delete(item)
        }
    }
}
