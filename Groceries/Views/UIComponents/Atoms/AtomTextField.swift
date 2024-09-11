//
//  GroceryTextField.swift
//  Gradients
//
//  Created by David Castro Cisneros on 09/09/24.
//

import SwiftUI

struct AtomTextField: View {
    @Binding var text: String
    
    private var title: String
    private var flexibleWidth = false
    
    init(_ title: String, text: Binding<String>) {
        self._text = text
        self.title = title
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, content: {
                Text(title)
                    .font(AppTheme.Fonts.placeholder)
                    .foregroundStyle(AppTheme.Colors.textPrimary)
                TextField("", text: $text)
                    .font(AppTheme.Fonts.regular)
                    .foregroundColor(AppTheme.Colors.textFieldForeground)
                    .frame(minHeight: AppTheme.Size.medium)
                    .padding(.horizontal)
                    .background(AppTheme.Colors.textFieldBackground)
                    .cornerRadius(AppTheme.Roundness.small)
                    
            })
            .accessibilityElement(children: .combine)
            
            Spacer()
        }
        .padding(.horizontal, AppTheme.Spacing._2x)
    }
}

#Preview {
    @State var text: String = ""
    
    return AtomTextField("Test", text: $text)
}
