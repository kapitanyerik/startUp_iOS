//
//  SignInWithAppleButton.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 04. 05..
//

import SwiftUI
import AuthenticationServices

struct SignInWithAppleButton: UIViewRepresentable {

    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(type: .signIn, style: .black)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
    }
}

struct SignInWithAppleButton_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithAppleButton()
    }
}
