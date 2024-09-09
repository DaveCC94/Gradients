//
//  GroceryAddViewTests.swift
//  GradientListFeatureTests
//
//  Created by David Castro Cisneros on 09/09/24.
//

import XCTest
@testable import GradientListFeature

final class GroveryAddItemViewModelTests: XCTestCase {
    func test_title_isLocalized() {
        XCTAssertEqual(makeSUT().title, NSLocalizedString("ADD_GROCERY_TITLE", tableName: "GroceriesListFeature", comment: "Verifying key usage"))
    }
    
    func test_buttonTitle_isLocalized() {
        XCTAssertEqual(makeSUT().buttonTitle, NSLocalizedString("ADD_GROCERY_BUTTON_TITLE", tableName: "GroceriesListFeature", comment: "Verifying key usage"))
    }
    
    func test_textFieldTitle_isLocalized() {
        XCTAssertEqual(makeSUT().textFieldTitle, NSLocalizedString("ADD_GROCERY_TEXTFIELD_TITLE", tableName: "GroceriesListFeature", comment: "Verifying key usage"))
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> GroveryAddItemViewModel {
        GroveryAddItemViewModel()
    }
}
