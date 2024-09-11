//
//  AppTheme.swift
//  Gradients
//
//  Created by David Castro Cisneros on 09/09/24.
//

import CoreGraphics
import SwiftUI

final class AppTheme {
    enum SystemIcon {
        static let add: String = "plus"
    }
    
    enum Spacing {
        static let _1x: CGFloat = 8
        static let _2x: CGFloat = 16
        static let _3x: CGFloat = 24
    }
    
    enum Fonts {
        static let button: Font = .body
        static let placeholder: Font = .body
        static let regular: Font = .body
    }
    
    enum Colors {
        static let primary: Color = Color(red: 0.0, green: 0.4, blue: 1)
        static let textPrimary: Color = Color(light: .black, dark: .white)
        static let textFieldForeground: Color = Color(light: .black, dark: .black)
        static let textFieldBackground: Color = Color(red: 0.9, green: 0.9, blue: 0.9)
    }
    
    enum Size {
        static let medium: CGFloat = 52
    }
    
    enum Roundness {
        static let small: CGFloat = 8
    }
    
    private init() { }
}

// MARK: - Dark Theme support

private extension Color {
    init(light: UIColor, dark: UIColor) {
        self = Color(UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? dark : light
        })
    }
}
