//
//  GroceryApp.swift
//  Groceries
//
//  Created by David Castro Cisneros on 09/09/24.
//
import GroceryListFeature
import SwiftData
import SwiftUI

@main
struct GroceryApp: App {
    @StateObject private var coordinator: Coordinator = Coordinator()
    private let container: ModelContainer? = try? ModelContainer(for: ManagedGroceryItem.self)
    private var fallBackViewModel = GroceryListViewModel(listProvider: InMemoryGroceryListProvider())
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.path, root: {
                makeRootView()
                    .navigationDestination(for: GroceryAddItemViewModel.self, destination: {
                        AddGroceryItemView(viewModel: $0)
                    })
            })
            .optionalModelContainer(container)
            .environmentObject(coordinator)
        }
    }
    
    @ViewBuilder private func makeRootView() -> some View {
        VStack {
            let isUITest = CommandLine.arguments.contains("UI-TEST")
            if self.container != nil && !isUITest {
                makePersistanceList(context: container!.mainContext)
            } else {
                makeInMemoryList()
            }
        }
    }
    
    @ViewBuilder private func makeInMemoryList() -> some View {
        GroceryListView(viewModel: fallBackViewModel)
    }
    
    @ViewBuilder private func makePersistanceList(context: ModelContext) -> some View {
        let listProvider = SwiftDataListProvider(modelContext: context)
        let viewModel = GroceryListViewModel(listProvider: listProvider)
        
        GroceryListView(viewModel: viewModel)
    }
}

// Persistance Conformance

extension ModelContext: ModelContextProtocol { }
