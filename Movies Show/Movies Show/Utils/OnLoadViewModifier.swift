//
//  OnLoadViewModifier.swift
//  Movies Show
//
//  Created by Navindas Ghadge on 30/11/23.
//

import Foundation
import SwiftUI

struct OnLoad: ViewModifier {
    @State private var isLoaded: Bool = false
    let action: () -> Void

    func body(content: Content) -> some View {
        content.onAppear {
            if !isLoaded {
                isLoaded = true
                action()
            }
        }
    }
}

extension View {
    func onLoad(perform action: @escaping () -> Void) -> some View {
        modifier(OnLoad(action: action))
    }
}
