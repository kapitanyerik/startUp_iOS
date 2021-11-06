//
//  PositiveButton.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 10. 23..
//

import SwiftUI

struct PositiveButton: View {
    var text: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(.green)
            .frame(width: 80, height: 50)
            .overlay(
                Text(text)
                    .foregroundColor(.white)
            )
            .padding()
    }
}
