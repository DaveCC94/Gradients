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
    
    // MARK: - Helpers:
    
    private func makeSUT() -> GroceryListViewModel {
        GroceryListViewModel()
    }
}
