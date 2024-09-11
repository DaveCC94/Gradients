//
//  OptionalModelContainerModifier.swift
//  Groceries
//
//  Created by David Castro Cisneros on 10/09/24.
//

import SwiftData
import SwiftUI

struct OptionalModelContainerModifier: ViewModifier {
    let modelContainer: ModelContainer?
    
    init(modelContainer: ModelContainer?) {
        self.modelContainer = modelContainer
    }
    
    func body(content: Content) -> some View {
        if let modelContainer {
            content
                .modelContainer(modelContainer)
        } else {
            content
        }
    }
}

extension View {
    func optionalModelContainer(_ modelContainer: ModelContainer?) -> some View {
        self.modifier(OptionalModelContainerModifier(modelContainer: modelContainer))
    }
}

