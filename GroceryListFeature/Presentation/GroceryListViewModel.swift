//
//  GradientViewModel.swift
//  GradientListFeature
//
//  Created by David Castro Cisneros on 09/09/24.
//

import Combine

public final class GroceryListViewModel: ObservableObject {
    public enum Error: Swift.Error {
        case invalidIndex
    }
    
    @frozen public enum State {
        case empty
        case content
    }
    
    public var state: State {
        listProvider.list.count == 0 ? .empty : .content
    }
    
    @Published public var showAddView: GroceryAddItemViewModel?
    @Published public var showDeleteView: Bool = false
    public var deleteRequestIndex: Int?
    public var groceryItems: [GroceryItem] { listProvider.list }
    private var listProvider: any GroceryListProvider
    
    public init(listProvider: any GroceryListProvider) {
        self.listProvider = listProvider
    }
    
    public func showDeleteRequestView(at index: Int) {
        deleteRequestIndex = index
        showDeleteView = true
    }
    
    public func hideDeleteRequestView() {
        deleteRequestIndex = nil
        showDeleteView = false
    }
    
    public func showAddNewItemView() {
        showAddView = GroceryAddItemViewModel(onAddItem: { [weak self] in
            self?.addItem(name: $0)
        })
    }
    
    public func hideAddNewItemView() {
        showAddView = nil
    }
    
    public func addItem(name: String) {
        listProvider.add(GroceryItem(name: name))
    }
    
    public func deleteItem() throws {
        guard let index = deleteRequestIndex, index >= 0 && index < listProvider.list.count else { throw Error.invalidIndex }
        
        listProvider.remove(at: index)
    }
}

// MARK: - Localization

private enum LocalizableKey: String.LocalizationValue {
    case title = "GROCERY_LIST_TITLE"
    case emptyStateMessage = "GROCERY_LIST_NO_ITEM_FOUND"
    case deleteTitle = "REMOVE_GROCERY_TITLE"
    case confirmDeletionTitle = "REMOVE_BUTTON_TITLE"
    case cancelDeletionTitle = "CANCEL_REMOVAL_BUTTON_TITLE"
}

extension GroceryListViewModel {
    public var title: String { String(localizedKey: LocalizableKey.title.rawValue) }
    public var emptyStateMessage: String { String(localizedKey: LocalizableKey.emptyStateMessage.rawValue) }
    public var confirmDeletionTitle: String { String(localizedKey: LocalizableKey.confirmDeletionTitle.rawValue) }
    public var cancelDeletionTitle: String { String(localizedKey: LocalizableKey.cancelDeletionTitle.rawValue) }
    public var deleteTitle: String { String(localizedKey: LocalizableKey.deleteTitle.rawValue) }
}
