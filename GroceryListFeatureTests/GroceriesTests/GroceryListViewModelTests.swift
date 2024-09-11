//
//  GroceryListViewModelTests.swift
//  GradientListFeatureTests
//
//  Created by David Castro Cisneros on 09/09/24.
//

import XCTest
@testable import GroceryListFeature

final class GroceryListViewModelTests: XCTestCase {
    func test_title_isLocalized() {
        XCTAssertEqual(makeSUT().title, NSLocalizedString("GROCERY_LIST_TITLE", tableName: "GroceriesListFeature", comment: "Verifying key existance"))
    }
    
    func test_emptyMessage_isLocalized() {
        XCTAssertEqual(makeSUT().emptyStateMessage, NSLocalizedString("GROCERY_LIST_NO_ITEM_FOUND", tableName: "GroceriesListFeature", comment: "Verifying key existance"))
    }
   
    func test_deleteTitle_isLocalized() {
        XCTAssertEqual(makeSUT().deleteTitle, NSLocalizedString("REMOVE_GROCERY_TITLE", tableName: "GroceriesListFeature", comment: "Verifying key usage"))
    }
    
    func test_confirmDeletionTitle_isLocalized() {
        XCTAssertEqual(makeSUT().confirmDeletionTitle, NSLocalizedString("REMOVE_BUTTON_TITLE", tableName: "GroceriesListFeature", comment: "Verifying key usage"))
    }
    
    func test_cancelDeletionTitle_isLocalized() {
        XCTAssertEqual(makeSUT().cancelDeletionTitle, NSLocalizedString("CANCEL_REMOVAL_BUTTON_TITLE", tableName: "GroceriesListFeature", comment: "Verifying key usage"))
    }
    
    func test_state_changesBasedOnProvidedItems() {
        let provider = fixtureProvider(numberOfItems: 0)
        let sut = makeSUT(listProvider: provider)
        
        assert(sut: sut, hasState: .empty)
        assert(sut: sut, hasState: .content, when: { provider.add(fixtureGroceryItem()) })
        assert(sut: sut, hasState: .empty, when: { provider.remove(at: 0) })
    }
    
    func test_init_showDeleteViewIsFalse() {
        let sut = makeSUT()
        
        XCTAssertFalse(sut.showDeleteView)
    }
 
    func test_onDeleteRequest_tracksIndex() {
        let sut = makeSUT()
        XCTAssertNil(sut.deleteRequestIndex)
        
        sut.showDeleteRequestView(at: 0)
        XCTAssertEqual(sut.deleteRequestIndex, 0)
        
        sut.hideDeleteRequestView()
        XCTAssertNil(sut.deleteRequestIndex)
    }
    
    func test_onDeleteRequest_showsAndHidesDeleteView() {
        let sut = makeSUT()
        
        sut.showDeleteRequestView(at: 0)
        XCTAssertTrue(sut.showDeleteView)
        
        sut.hideDeleteRequestView()
        XCTAssertFalse(sut.showDeleteView)
    }
  
    func test_onDeleteItem_deleteItemAtSpecifiedIndex() throws {
        let provider = fixtureProvider(numberOfItems: 1)
        let sut = makeSUT(listProvider: provider)
        sut.deleteRequestIndex = 0
        
        try sut.deleteItem()
        
        XCTAssertEqual(provider.calls, [.remove(0)])
    }
    
    func test_onDeleteItem_throwsErrorOnInvalidIndex() throws {
        let provider = fixtureProvider(numberOfItems: 0)
        let sut = makeSUT(listProvider: provider)
        
        sut.deleteRequestIndex = -1
        XCTAssertThrowsError(try sut.deleteItem())
        
        sut.deleteRequestIndex = 0
        XCTAssertThrowsError(try sut.deleteItem())
        
        sut.deleteRequestIndex = 1
        XCTAssertThrowsError(try sut.deleteItem())
        
        XCTAssertTrue(provider.calls.isEmpty)
    }

    func test_onAddItem_doesNotAddItIfEmpty() {
        let provider = fixtureProvider(numberOfItems: 0)
        let sut = makeSUT(listProvider: provider)
        
        sut.addItem(name: "")
        sut.addItem(name: "    ")
        
        XCTAssertEqual(provider.calls, [])
    }
    
    func test_onAddItem_insertsItemToProvider() {
        let provider = fixtureProvider(numberOfItems: 0)
        let sut = makeSUT(listProvider: provider)
        
        sut.addItem(name: "test")
        
        XCTAssertEqual(provider.calls, [.add(GroceryItem(name: "test"))])
    }
    
    func test_list_reflectsCurrentState() {
        let provider = fixtureProvider(numberOfItems: 0)
        let sut = makeSUT(listProvider: provider)
        let fixture = fixtureGroceryItem()
        
        XCTAssertEqual(sut.groceryItems, [])
        
        provider.add(fixture)
        XCTAssertEqual(sut.groceryItems, [fixture])
        
        provider.remove(at: 0)
        XCTAssertEqual(sut.groceryItems, [])
    }
    
    // MARK: - Helpers
    
    private func assert(sut: GroceryListViewModel, hasState state: GroceryListViewModel.State, when action: () -> Void = {}) {
        action()
        XCTAssertTrue(sut.state == state)
    }
    
    private func makeSUT(listProvider: ProviderSpy = ProviderSpy(), file: StaticString = #filePath, line: UInt = #line) -> GroceryListViewModel {
        let sut = GroceryListViewModel(listProvider: listProvider)
        
        trackForMemoryLeaks(sut, file: file, line: line)
        
        return sut
    }
    
    private func fixtureProvider(numberOfItems: Int = 0, file: StaticString = #filePath, line: UInt = #line) -> ProviderSpy {
        let spy = ProviderSpy(list: Array(repeating: GroceryItem(name: "any name"), count: numberOfItems))
        
        trackForMemoryLeaks(spy, file: file, line: line)
        
        return spy
        
    }
    
    final class ProviderSpy: GroceryListProvider {
        enum Call: Equatable {
            case add(GroceryItem)
            case remove(Int)
        }
        
        var list: [GroceryItem]
        var calls = [Call]()
        
        init(list: [GroceryItem] = []) {
            self.list = list
        }
        
        func remove(at index: Int) {
            calls.append(.remove(index))
            list.remove(at: index)
        }
        
        func add(_ item: GroceryListFeature.GroceryItem) {
            calls.append(.add(item))
            list.append(item)
        }
    }
}
