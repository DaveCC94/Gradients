//
//  GroceryTextField.swift
//  Gradients
//
//  Created by David Castro Cisneros on 09/09/24.
//

import SwiftUI

struct GroceryTextField: View {
    @Binding var text: String
    
    private var title: String
    private var action: () -> Void
    private var flexibleWidth = false
    
    init(_ title: String, text: Binding<String>, action: @escaping () -> Void) {
        self._text = text
        self.title = title
        self.action = action
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, content: {
                Text(title)
                    .font(.system(size: 18, weight: .semibold))
                TextField("", text: $text)
                    .padding(.horizontal)
                    .frame(height: 48)
                    .background(Color(red: 0.925, green: 0.925, blue: 0.925))
                    .cornerRadius(8)
            })
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview(body: {
    @State var text: String = ""
    
    return GroceryTextField("Test", text: $text, action: {})
})
