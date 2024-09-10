//
//  AppTheme.swift
//  Gradients
//
//  Created by David Castro Cisneros on 09/09/24.
//

import CoreGraphics
import SwiftUI

extension Color {
    init(light: UIColor, dark: UIColor) {
        self = Color(UIColor { traitCollection in
            return traitCollection.userInterfaceStyle == .dark ? dark : light
        })
    }
}

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
        static let button: Font = .system(size: 14, weight: .semibold)
        static let placeholder: Font = .system(size: 16, weight: .semibold)
        static let regular: Font = .system(size: 14, weight: .regular)
    }
    
    enum Colors {
        static let primary: Color = .blue
        static let textPrimary: Color = Color(light: .black, dark: .white)
        static let textFieldForeground: Color = Color(light: .black, dark: .black)
        static let textFieldBackground: Color = Color(red: 0.925, green: 0.925, blue: 0.925)
    }
    
    enum Size {
        static let medium: CGFloat = 48
    }
    
    enum Roundness {
        static let small: CGFloat = 8
    }
    
    private init() { }
}
