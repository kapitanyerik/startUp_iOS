//
//  FlatGlassView.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 09. 24..
//

import SwiftUI

struct GlassField : ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .padding()
                .frame(height: 50)
                .background(.ultraThinMaterial)
                .cornerRadius(12)
        } else {
            // Fallback on earlier versions
            content
                .padding()
                .frame(height: 50)
                .cornerRadius(14)
        }
    }
}
