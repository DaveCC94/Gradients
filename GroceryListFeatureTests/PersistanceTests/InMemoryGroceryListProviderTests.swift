//
//  InMemoryGroceryListProviderTests.swift
//  GradientListFeatureTests
//
//  Created by David Castro Cisneros on 09/09/24.
//

import GroceryListFeature
import XCTest

final class InMemoryGroceryListProviderTests: XCTestCase {
    func test_init_doesNotInitializeItems() {
        XCTAssertTrue(makeSUT().list.isEmpty)
    }
    
    func test_add_pushesAtTheEnd() {
        let sut = makeSUT()
        
        let item1 = fixtureGroceryItem("1")
        let item2 = fixtureGroceryItem("2")
        
        sut.add(fixtureGroceryItem(item1.name))
        sut.add(fixtureGroceryItem(item2.name))
        
        XCTAssertEqual(sut.list, [item1, item2])
    }
    
    func test_removeAt_especifiedIndex() {
        let sut = makeSUT()
        
        let item1 = fixtureGroceryItem("1")
        let item2 = fixtureGroceryItem("2")
        
        sut.add(fixtureGroceryItem(item1.name))
        sut.add(fixtureGroceryItem(item2.name))
        
        sut.remove(at: 1)
        
        XCTAssertEqual(sut.list, [item1])
    }
    
    // MARK: - Helpers
    
    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> InMemoryGroceryListProvider {
        let sut = InMemoryGroceryListProvider()
        
        trackForMemoryLeaks(sut, file: file, line: line)
        
        return sut
    }
}
