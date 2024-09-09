//
//  InMemoryGroscryListProvider.swift
//  GradientListFeature
//
//  Created by David Castro Cisneros on 09/09/24.
//

public final class InMemoryGroceryListProvider: GroceryListProvider {
    public private(set) var list: [GroceryListFeature.GroceryItem]
    
    public init(list: [GroceryListFeature.GroceryItem] = []) {
        self.list = list
    }
    
    public func add(_ item: GroceryListFeature.GroceryItem) {
        list.append(item)
    }
    
    public func remove(at index: Int) {
        list.remove(at: index)
    }
}
