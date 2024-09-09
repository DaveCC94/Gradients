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
    
    enum Error: Swift.Error {
        case invalidIndex
    }
    
    enum State {
        case empty
        case content
    }
    
    enum Destination  {
        case addItemView
    }
    
    enum Path {
        case deleteView
    }
    
    var state: State {
        listProvider.list.count == 0 ? .empty : .content
    }
    
    var destination: Destination?
    var path: Path?
    var title: String { String(localizedKey: LocalizableKey.title.rawValue) }
    var emptyStateMessage: String { String(localizedKey: LocalizableKey.emptyStateMessage.rawValue) }
    var listProvider: any GroceryListProvider
    
    init(listProvider: any GroceryListProvider) {
        self.listProvider = listProvider
    }
    
    func showDeleteRequestView() {
        path = .deleteView
    }
    
    func showAddNewItemView() {
        destination = .addItemView
    }
    
    func addItem(name: String) {
        listProvider.add(GroceryItem(name: name))
    }
    
    func deleteItem(at index: Int) throws {
        guard index >= 0 && index < listProvider.list.count else { throw Error.invalidIndex }
        
        listProvider.remove(at: index)
    }
}
