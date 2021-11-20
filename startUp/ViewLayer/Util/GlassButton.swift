//
//  GlassButton.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 10. 23..
//

import SwiftUI

struct GlassButton: View {
    var text: String
    var maxWidth: CGFloat? = nil

    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .stroke(lineWidth: 0.5)
            .frame(maxWidth: maxWidth ?? .infinity, idealHeight: 50, maxHeight: 50)
            .overlay {
                Text(text)
            }
            .padding(.horizontal)
            .padding(.top)
    }
}
