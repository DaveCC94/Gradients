//
//  GroceryListView.swift
//  Gradients
//
//  Created by David Castro Cisneros on 09/09/24.
//

import GroceryListFeature
import SwiftUI

struct GroceryListView: View {
    @ObservedObject private var viewModel: GroceryListViewModel
    @EnvironmentObject var coordinator: Coordinator
    
    init(viewModel: GroceryListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: .zero) {
            Divider()
            switch viewModel.state {
            case .empty:
                emptyState()
            case .content:
                content()
            }
        }
        .navigationTitle(viewModel.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) { [weak viewModel] in
                Button(action: { [weak viewModel] in
                    coordinator.navigateToAddGrocery(onAddItem: viewModel?.addItem(name:))
                }) {
                    Image(systemName: AppTheme.SystemIcon.add)
                        .foregroundStyle(AppTheme.Colors.primary)
                }
            }
        }
        .alert(viewModel.deleteTitle, isPresented: $viewModel.showDeleteView) { [unowned viewModel] in
            Button(viewModel.confirmDeletionTitle, role: .destructive) { [weak viewModel] in
                try? viewModel?.deleteItem()
                viewModel?.hideDeleteRequestView()
            }
            Button(viewModel.cancelDeletionTitle, role: .cancel) { [weak viewModel] in
                viewModel?.hideDeleteRequestView()
            }
        }
    }
    
    @ViewBuilder func emptyState() -> some View {
        VStack {
            Spacer()
            Text(viewModel.emptyStateMessage)
                .font(AppTheme.Fonts.regular)
                .foregroundStyle(AppTheme.Colors.textPrimary)
            Spacer()
        }
    }
    
    @ViewBuilder func content() -> some View {
        VStack(spacing: .zero) {
            MoleculeListView(items: viewModel.groceryItems, content: { index, grocery in
                Text(grocery.name)
                    .onTapGesture { [weak viewModel] in
                        viewModel?.showDeleteRequestView(at: index)
                    }
            })
        
            Spacer(minLength: 0)
        }
    }
}

#Preview("Content Found State") {
    var provider: InMemoryGroceryListProvider {
        let memoryProvider = InMemoryGroceryListProvider()
        memoryProvider.add(GroceryItem(name: "Eggs"))
        memoryProvider.add(GroceryItem(name: "Milk"))
        memoryProvider.add(GroceryItem(name: "Butter"))
        memoryProvider.add(GroceryItem(name: "Pickle"))
        return memoryProvider
    }
    
    return NavigationView(content: {
        GroceryListView(viewModel: GroceryListViewModel(listProvider: provider))
    })
}

#Preview("Empty State") {
    let provider = InMemoryGroceryListProvider()
    return NavigationView(content: {
        GroceryListView(viewModel: GroceryListViewModel(listProvider: provider))
    })
}
