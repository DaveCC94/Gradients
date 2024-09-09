//
//  GroceryListProvider.swift
//  GradientListFeature
//
//  Created by David Castro Cisneros on 09/09/24.
//

protocol GroceryListProvider: ObservableObject {
    var list: [GroceryItem] { get }
    
    func add(_ item: GroceryItem)
    func remove(at index: Int)
}
