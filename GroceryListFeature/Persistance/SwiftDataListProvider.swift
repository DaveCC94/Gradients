//
//  SwiftDataListProvider.swift
//  GroceryListFeature
//
//  Created by David Castro Cisneros on 10/09/24.
//

import Combine
import SwiftData
import SwiftUI

@Model
final public class ManagedGroceryItem {
    @Attribute(.unique) public var id: UUID
    public var name: String
    
    init(name: String) {
        self.id = UUID()
        self.name = name
    }
}

extension GroceryItem {
    init(fromManagedObject object: ManagedGroceryItem) {
        self.init(name: object.name)
    }
}

public protocol ModelContextProtocol {
    func fetch<T>(_ descriptor: FetchDescriptor<T>) throws -> [T] where T: ManagedGroceryItem
    func insert<T>(_ item: T) where T: ManagedGroceryItem
    func delete<T>(_ item: T) where T: ManagedGroceryItem
}

final public class SwiftDataListProvider: ObservableObject, GroceryListProvider {
    private var modelContext: ModelContextProtocol
    
    public init(modelContext: ModelContextProtocol) {
        self.modelContext = modelContext
    }
    
    public var managedList: [ManagedGroceryItem] {
        do {
            let descriptor = FetchDescriptor<ManagedGroceryItem>(sortBy: [SortDescriptor(\.name)])
            return try modelContext.fetch(descriptor)
        } catch {
            return []
        }
    }
    
    public var list: [GroceryItem] {
        managedList.map { .init(fromManagedObject: $0) }
    }
    
    public func add(_ item: GroceryItem) {
        let newItem = ManagedGroceryItem(name: item.name)
        modelContext.insert(newItem)
    }
    
    public func remove(at index: Int) {
        let managedItem = managedList[index]
        modelContext.delete(managedItem)
    }
}
