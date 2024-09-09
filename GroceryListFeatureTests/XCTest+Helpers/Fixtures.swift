//
//  Fixtures.swift
//  GradientListFeatureTests
//
//  Created by David Castro Cisneros on 09/09/24.
//

import XCTest
@testable import GroceryListFeature

extension XCTestCase {
    func fixtureGroceryItem(_ name: String = "fixture item") -> GroceryItem {
        GroceryItem(name: name)
    }
}
