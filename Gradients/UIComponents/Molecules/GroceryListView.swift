//
//  GroceryListView.swift
//  Gradients
//
//  Created by David Castro Cisneros on 09/09/24.
//

import SwiftUI

struct GroceryListView<Content: View, Data>: View {
    @ViewBuilder private var content: (Data) -> Content
    var items: [Data]

    init(items: [Data], content: @escaping (Data) -> Content) {
        self.content = content
        self.items = items
    }
    
    var body: some View {
        List(items.indices, id: \.self) { index in
            GroceryRowView(showDivider: index != items.count - 1) {
                content(items[index])
            }
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets())
        }
    }
}

#Preview {
    return GroceryListView(items: ["Anything", "Something", "Other", "Next", "More elements", "Final"]) { item in
        Text(item)
    }
}
