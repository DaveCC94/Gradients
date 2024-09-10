//
//  Coordinator.swift
//  Gradients
//
//  Created by David Castro Cisneros on 10/09/24.
//

import GroceryListFeature
import SwiftUI

final class Coordinator: ObservableObject {
    @Published var path: NavigationPath = .init()
    
    func pop() {
        path.removeLast()
    }
    
    func navigateToAddGrocery(onAddItem: ((String) -> Void)?) {
        let viewModel = GroceryAddItemViewModel(onAddItem: onAddItem)
        path.append(viewModel)
    }
}
