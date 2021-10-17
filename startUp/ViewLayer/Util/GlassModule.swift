//
//  GlassBackground.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 10. 03..
//

import SwiftUI

struct GlassModule : ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .padding()
                .background(.ultraThinMaterial)
                .foregroundColor(Color.primary.opacity(0.35))
                .foregroundStyle(.ultraThinMaterial)
                .cornerRadius(24)
                .padding()
        } else {
            // Fallback on earlier versions
            content
                .padding()
                .frame(height: 50)
                .cornerRadius(14)
        }
    }
}
