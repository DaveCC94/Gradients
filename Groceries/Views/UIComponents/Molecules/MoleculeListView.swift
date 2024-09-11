//
//  MoleculeListView.swift
//  Gradients
//
//  Created by David Castro Cisneros on 09/09/24.
//

import SwiftUI

struct MoleculeListView<Content: View, Data: Hashable>: View {
    @ViewBuilder private var content: ((Int, Data)) -> Content
    var items: [Data]
    
    init(items: [Data], content: @escaping ((Int, Data)) -> Content) {
        self.content = content
        self.items = items
    }
    
    var body: some View {
        List(items.indices, id: \.self) { index in
            AtomRowView {
                content((index, items[index]))
            }
            .listRowSeparator(.hidden)
            .listRowInsets(
                EdgeInsets(top: .zero, leading: -AppTheme.Spacing._1x, bottom: .zero, trailing: -AppTheme.Spacing._1x)
            )
        }
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    MoleculeListView(items: ["Anything", "Something", "Other", "Next", "More elements", "Final"]) { index, item in
        Text(item)
    }
}
