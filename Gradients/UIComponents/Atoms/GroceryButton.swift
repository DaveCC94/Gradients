//
//  GroceryButton.swift
//  Gradients
//
//  Created by David Castro Cisneros on 09/09/24.
//

import SwiftUI

struct GroceryButton: View {
    private var title: String
    private var action: () -> Void
    private var flexibleWidth = false
    
    init(_ title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(title)
                .padding(.horizontal)
                .padding(.horizontal)
                .frame(maxWidth: flexibleWidth ? .infinity : nil)
        })
        .font(.system(size: 18, weight: .semibold))
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .padding()
    }
}

#Preview(body: {
    GroceryButton("Test", action: {})
})
