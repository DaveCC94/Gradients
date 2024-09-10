//
//  GroceryRemoveItemViewModelTests.swift
//  GradientListFeatureTests
//
//  Created by David Castro Cisneros on 09/09/24.
//

import XCTest
@testable import GroceryListFeature

final class GroceryRemoveItemViewModelTests: XCTestCase {
   
    
    // MARK: - Helpers
    
    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> GroceryRemoveItemViewModel {
        let sut = GroceryRemoveItemViewModel()
        
        trackForMemoryLeaks(sut, file: file, line: line)
        
        return sut
    }
}
