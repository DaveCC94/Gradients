//
//  GradientListViewModel.swift
//  GradientListFeatureTests
//
//  Created by David Castro Cisneros on 09/09/24.
//

import XCTest
@testable import GradientListFeature

final class GroceryListViewModelTests: XCTestCase {
    func test_title_isLocalized() {
        XCTAssertEqual(makeSUT().title, NSLocalizedString("GROCERY_LIST_TITLE", tableName: "GroceriesListFeature", comment: "Verifying key existance"))
    }
    
    func test_emptyMessage_isLocalized() {
        XCTAssertEqual(makeSUT().emptyStateMessage, NSLocalizedString("GROCERY_LIST_NO_ITEM_FOUND", tableName: "GroceriesListFeature", comment: "Verifying key existance"))
    }
   
    func test_state_changesBasedOnProvidedItems() {
        let provider = fixtureProvider(numberOfItems: 0)
        let sut = makeSUT(listProvider: provider)
        
        assert(sut: sut, hasState: .empty)
        assert(sut: sut, hasState: .content, when: { provider.list.append(fixtureItem()) })
        assert(sut: sut, hasState: .empty, when: { provider.list.removeAll() })
    }
    
    func test_onDeleteRequest_changesPathToDeleteView() {
        let sut = makeSUT()
        
        sut.showDeleteRequestView()
        
        XCTAssertEqual(sut.path, .deleteView)
    }
    
    func test_onAddItem_changesDestinationToAddItemView() {
        let sut = makeSUT()
        
        sut.showAddNewItemView()
        
        XCTAssertEqual(sut.destination, .addItemView)
    }
    
    func test_onDeleteItem_deleteItemAtSpecifiedIndex() throws {
        let provider = fixtureProvider(numberOfItems: 1)
        let sut = makeSUT(listProvider: provider)
        
        try sut.deleteItem(at: 0)
        
        XCTAssertEqual(provider.calls, [.remove(0)])
    }
    
    func test_onDeleteItem_throwsErrorOnInvalidIndex() throws {
        let provider = fixtureProvider(numberOfItems: 0)
        let sut = makeSUT(listProvider: provider)
        
        XCTAssertThrowsError(try sut.deleteItem(at: -1))
        XCTAssertThrowsError(try sut.deleteItem(at: 0))
        XCTAssertThrowsError(try sut.deleteItem(at: 1))
        
        XCTAssertTrue(provider.calls.isEmpty)
    }
    
    // MARK: - Helpers:
    
    private func assert(sut: GroceryListViewModel, hasState state: GroceryListViewModel.State, when action: () -> Void = {}) {
        action()
        XCTAssertTrue(sut.state == state)
    }
    
    private func makeSUT(listProvider: ProviderSpy = ProviderSpy()) -> GroceryListViewModel {
        GroceryListViewModel(listProvider: listProvider)
    }
    
    private func fixtureProvider(numberOfItems: Int = 0) -> ProviderSpy {
        ProviderSpy(list: Array(repeating: GroceryItem(name: "any name"), count: numberOfItems))
    }
    
    private func fixtureItem(_ name: String = "fixture item") -> GroceryItem {
        GroceryItem(name: name)
    }
    
    final class ProviderSpy: GroceryListProvider {
        enum Call: Equatable {
            case remove(Int)
        }
        
        var list: [GroceryItem]
        var calls = [Call]()
        
        init(list: [GroceryItem] = []) {
            self.list = list
        }
        
        func remove(at index: Int) {
            calls.append(.remove(index))
        }
    }
}
