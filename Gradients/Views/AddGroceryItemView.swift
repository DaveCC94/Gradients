//
//  AddGroceryItemView.swift
//  Gradients
//
//  Created by David Castro Cisneros on 09/09/24.
//

import GroceryListFeature
import SwiftUI

struct AddGroceryItemView: View {
    private var viewModel: GroceryAddItemViewModel
    @State private var text: String = ""
    @EnvironmentObject var coordinator: Coordinator
    
    init(viewModel: GroceryAddItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Divider()
            GroceryTextField(viewModel.textFieldTitle, text: $text)
            AtomButton(viewModel.buttonTitle, action: { [weak viewModel] in
                viewModel?.onAddItem?(text)
                coordinator.pop()
            })
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(viewModel.title)
    }
}

#Preview {
    NavigationView {
        AddGroceryItemView(viewModel: GroceryAddItemViewModel())
    }
}
