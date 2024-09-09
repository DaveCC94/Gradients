//
//  GroceryRemoveItemViewModelTests.swift
//  GradientListFeatureTests
//
//  Created by David Castro Cisneros on 09/09/24.
//

import XCTest
@testable import GroceryListFeature

final class GroceryRemoveItemViewModelTests: XCTestCase {
    func test_title_isLocalized() {
        XCTAssertEqual(makeSUT().title, NSLocalizedString("REMOVE_GROCERY_TITLE", tableName: "GroceriesListFeature", comment: "Verifying key usage"))
    }
    
    func test_confirmDeletionTitle_isLocalized() {
        XCTAssertEqual(makeSUT().confirmDeletionTitle, NSLocalizedString("REMOVE_BUTTON_TITLE", tableName: "GroceriesListFeature", comment: "Verifying key usage"))
    }
    
    func test_cancelDeletionTitle_isLocalized() {
        XCTAssertEqual(makeSUT().cancelDeletionTitle, NSLocalizedString("CANCEL_REMOVAL_BUTTON_TITLE", tableName: "GroceriesListFeature", comment: "Verifying key usage"))
    }
    
    // MARK: - Helpers
    
    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> GroceryRemoveItemViewModel {
        let sut = GroceryRemoveItemViewModel()
        
        trackForMemoryLeaks(sut, file: file, line: line)
        
        return sut
    }
}
