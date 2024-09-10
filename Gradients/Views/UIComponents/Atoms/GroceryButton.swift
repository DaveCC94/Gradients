//
//  AtomButton.swift
//  Gradients
//
//  Created by David Castro Cisneros on 09/09/24.
//

import SwiftUI

struct AtomButton: View {
    private var title: String
    private var action: () -> Void
    
    init(_ title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(title)
                .padding(.horizontal, AppTheme.Spacing._3x)
            
        })
        .font(AppTheme.Fonts.button)
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .tint(AppTheme.Colors.primary)
    }
}

#Preview {
    AtomButton("Test") { }
}
