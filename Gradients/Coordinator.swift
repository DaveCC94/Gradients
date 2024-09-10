//
//  Coordinator.swift
//  Gradients
//
//  Created by David Castro Cisneros on 10/09/24.
//

import SwiftUI

final class Coordinator: ObservableObject {
    @Published var path: NavigationPath = .init()
    
    func pop() {
        path.removeLast()
    }
}
