//
//  GroceryRowView.swift
//  Gradients
//
//  Created by David Castro Cisneros on 09/09/24.
//

import SwiftUI

struct AtomRowView<Content: View>: View {
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
        AtomRowView {
            Text("Some row")
        }
        AtomRowView {
            Text("Some row2")
        }
        AtomRowView {
            Text("Some row3")
        }
    }
}
