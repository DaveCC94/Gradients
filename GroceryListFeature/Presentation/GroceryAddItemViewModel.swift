//
//  GroveryAddItemViewModel.swift
//  GradientListFeature
//
//  Created by David Castro Cisneros on 09/09/24.
//

import Combine
import Foundation

final public class GroceryAddItemViewModel: ObservableObject {
    private let id = UUID()
    public var onAddItem: ((String) -> Void)?
    
    public init(onAddItem: ((String) -> Void)? = nil) {
        self.onAddItem = onAddItem
    }
}

// MARK: - Hashable Conformance

extension GroceryAddItemViewModel: Hashable {
    public static func == (lhs: GroceryAddItemViewModel, rhs: GroceryAddItemViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Localization

private enum LocalizableKey: String.LocalizationValue {
    case title = "ADD_GROCERY_TITLE"
    case buttonTitle = "ADD_GROCERY_BUTTON_TITLE"
    case textFieldTitle = "ADD_GROCERY_TEXTFIELD_TITLE"
}

public extension GroceryAddItemViewModel {
    var title: String { String(localizedKey: LocalizableKey.title.rawValue) }
    var buttonTitle: String { String(localizedKey: LocalizableKey.buttonTitle.rawValue) }
    var textFieldTitle: String { String(localizedKey: LocalizableKey.textFieldTitle.rawValue) }
}

