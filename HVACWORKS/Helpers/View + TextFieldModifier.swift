//
//  View + TextFieldModifier.swift
//  HVACWORKS
//
//  Created by Sergio Bost on 2/24/21.
//

import SwiftUI
struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.numberPad)
            .padding(.horizontal)
    }
}

extension View {
    func personalizeTextField () -> some View {
        return self.modifier(TextFieldModifier())
    }
}
