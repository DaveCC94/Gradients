//
//  GroveryAddItemViewModel.swift
//  GradientListFeature
//
//  Created by David Castro Cisneros on 09/09/24.
//

final class GroveryAddItemViewModel {
    private enum LocalizableKey: String.LocalizationValue {
        case title = "ADD_GROCERY_TITLE"
        case buttonTitle = "ADD_GROCERY_BUTTON_TITLE"
        case textFieldTitle = "ADD_GROCERY_TEXTFIELD_TITLE"
    }
    
    var title: String { String(localizedKey: LocalizableKey.title.rawValue) }
    var buttonTitle: String { String(localizedKey: LocalizableKey.buttonTitle.rawValue) }
    var textFieldTitle: String { String(localizedKey: LocalizableKey.textFieldTitle.rawValue) }
    
    var onAddItem: ((String) -> Void)?
}
