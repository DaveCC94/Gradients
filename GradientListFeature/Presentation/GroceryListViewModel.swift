//
//  GradientViewModel.swift
//  GradientListFeature
//
//  Created by David Castro Cisneros on 09/09/24.
//

final class GroceryListViewModel {
    private enum LocalizableKey: String.LocalizationValue {
        case title = "GROCERY_LIST_TITLE"
    }
    
    var title: String {
        String(localizedKey: LocalizableKey.title.rawValue)
    }
    
    init() {
        
    }
}
