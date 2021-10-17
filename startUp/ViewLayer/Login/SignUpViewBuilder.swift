//
//  SignUpViewBuilder.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 09. 24..
//

import SwiftUI

enum SignUpViewBuilder {
    static func makeSignUpView(email: String, password: String) -> some View {
        let viewModel = SignUpViewModel(email: email, password: password)
        return SignUpView(viewModel: viewModel)
    }
}
