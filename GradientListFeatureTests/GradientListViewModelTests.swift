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
        
        sut.showDeleteRequest()
        
        XCTAssertEqual(sut.path, .deleteView)
    }
    
    // MARK: - Helpers:
    
    private func assert(sut: GroceryListViewModel, hasState state: GroceryListViewModel.State, when action: () -> Void = {}) {
        action()
        XCTAssertTrue(sut.state == state)
    }
    
    private func makeSUT(listProvider: ProviderStub = ProviderStub()) -> GroceryListViewModel {
        GroceryListViewModel(listProvider: listProvider)
    }
    
    private func fixtureProvider(numberOfItems: Int = 0) -> ProviderStub {
        ProviderStub(list: Array(repeating: GroceryItem(name: "any name"), count: numberOfItems))
    }
    
    private func fixtureItem(_ name: String = "fixture item") -> GroceryItem {
        GroceryItem(name: name)
    }
    
    final class ProviderStub: GroceryListProvider {
        var list: [GroceryItem]
        
        init(list: [GroceryItem] = []) {
            self.list = list
        }
        
        func getList() -> [GroceryItem] {
            list
        }
    }
}
