//
//  MultilineGlassField.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 10. 24..
//

import SwiftUI

struct MultiLineGlassField: View {
    var text: Binding<String>
    var placeholder: String
    @FocusState var isMultiLineTextFocused: Bool
    
    init(text: Binding<String>, placeholder: String) {
        self.text = text
        self.placeholder = placeholder
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack (alignment: .topLeading) {
            TextEditor(text: text)
                .disableAutocorrection(true)
                .modifier(GlassField())
                .focused($isMultiLineTextFocused)
            
            if (text.wrappedValue.isEmpty) {
                Text(placeholder)
                    .opacity(0.6)
                    .padding(.leading, 21)
                    .padding(.top, 24)
                    .onTapGesture {
                        isMultiLineTextFocused = true
                    }
            }
        }
    }
}
