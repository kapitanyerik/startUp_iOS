//
//  GlassBackground.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 10. 03..
//

import SwiftUI

struct GlassModule : ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.ultraThinMaterial)
            .foregroundColor(.primary.opacity(0.35))
            .foregroundStyle(.ultraThinMaterial)
            .cornerRadius(24)
    }
}
