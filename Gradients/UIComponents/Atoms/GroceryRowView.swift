//
//  GroceryRowView.swift
//  Gradients
//
//  Created by David Castro Cisneros on 09/09/24.
//

import SwiftUI

struct GroceryRowView<Content: View>: View {
    @ViewBuilder private var content: () -> Content
    private var showDivider: Bool
    
    init(showDivider: Bool = false, content: @escaping () -> Content) {
        self.showDivider = showDivider
        self.content = content
    }
    
    var body: some View {
        VStack {
            HStack() {
                content()
                Spacer()
            }
            if showDivider {
                Divider()
            }
            
        }
        .padding(.horizontal)
    }
}

#Preview(body: {
    VStack {
        Divider()
        GroceryRowView(showDivider: true) {
            Text("Some row")
        }
        GroceryRowView(showDivider: true) {
            Text("Some row")
        }
        GroceryRowView {
            Text("Some row")
        }
        Divider()
    }
})
