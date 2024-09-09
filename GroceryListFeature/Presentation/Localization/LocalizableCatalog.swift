//
//  File.swift
//  GradientListFeature
//
//  Created by David Castro Cisneros on 09/09/24.
//

import Foundation

enum LocalizableCatalog: String {
    case groceryList = "GroceriesListFeature"
}

// MARK: - LocalizableCatalog + String

extension String {
    init(localizedKey: String.LocalizationValue, catalog: LocalizableCatalog = .groceryList) {
        self.init(localized: localizedKey, table: catalog.rawValue)
    }
}
