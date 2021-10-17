//
//  LoginViewModel.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 09. 24..
//

import Combine
import SwiftUI

class LoginViewModel: ObservableObject {
    var authenticationInteractor = AuthenticationInteractor.instance
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signIn() {
        authenticationInteractor.signIn(email: email, password: password)
    }
    
    func signInAnonimously() {
        authenticationInteractor.signInAnonimously()
    }
    
    func navigateToSignUp() -> some View {
        return SignUpViewBuilder.makeSignUpView(email: email, password: password)
    }
}
