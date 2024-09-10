//
//  GroceryApp.swift
//  Groceries
//
//  Created by David Castro Cisneros on 09/09/24.
//

import SwiftUI
import GroceryListFeature

@main
struct GroceryApp: App {
    @StateObject private var coordinator = Coordinator()
    @ObservedObject private var viewModel = GroceryListViewModel(listProvider: InMemoryGroceryListProvider())
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path, root: {
                GroceryListView(viewModel: viewModel)
                    .navigationDestination(for: GroceryAddItemViewModel.self, destination: {
                        AddGroceryItemView(viewModel: $0)
                })
            })
            .environmentObject(coordinator)
        }
    }
}
