//
//  GroceryRowView.swift
//  Gradients
//
//  Created by David Castro Cisneros on 09/09/24.
//

import SwiftUI

struct GroceryRowView<Content: View>: View {
    @ViewBuilder private var content: () -> Content
    
    init(content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack {
            HStack() {
                content()
                Spacer(minLength: .zero)
            }
            
            Divider()
        }
        .padding(.horizontal)
    }
}

#Preview {
    VStack {
        GroceryRowView {
            Text("Some row")
        }
        GroceryRowView {
            Text("Some row2")
        }
        GroceryRowView {
            Text("Some row3")
        }
    }
}
