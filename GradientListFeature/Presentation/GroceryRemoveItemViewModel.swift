//
//  GroceryRemoveItemViewModel.swift
//  GradientListFeature
//
//  Created by David Castro Cisneros on 09/09/24.
//

final class GroveryRemoveItemViewModel {
    private enum LocalizableKey: String.LocalizationValue {
        case title = "REMOVE_GROCERY_TITLE"
        case confirmDeletionTitle = "REMOVE_BUTTON_TITLE"
        case cancelDeletionTitle = "CANCEL_REMOVAL_BUTTON_TITLE"
    }
    
    var title: String { String(localizedKey: LocalizableKey.title.rawValue) }
    var confirmDeletionTitle: String { String(localizedKey: LocalizableKey.confirmDeletionTitle.rawValue) }
    var cancelDeletionTitle: String { String(localizedKey: LocalizableKey.cancelDeletionTitle.rawValue) }
    
    var onRemoveItem: (() -> Void)?
}
