//
//  GradientViewModel.swift
//  GradientListFeature
//
//  Created by David Castro Cisneros on 09/09/24.
//

final class GroceryListViewModel {
    private enum LocalizableKey: String.LocalizationValue {
        case title = "GROCERY_LIST_TITLE"
        case emptyStateMessage = "GROCERY_LIST_NO_ITEM_FOUND"
    }
    
    var title: String {
        String(localizedKey: LocalizableKey.title.rawValue)
    }
    
    var emptyStateMessage: String {
        String(localizedKey: LocalizableKey.emptyStateMessage.rawValue)
    }
    
    init() {
        
    }
}
