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
        XCTAssertTrue(sut.state == .empty)
        
        provider.list.append(fixtureItem())
        XCTAssertTrue(sut.state == .content)
        
        provider.list.removeAll()
        XCTAssertTrue(sut.state == .empty)
    }
    
    // MARK: - Helpers:
    
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
