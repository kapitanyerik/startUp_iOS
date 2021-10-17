//
//  LoginViewModel.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 09. 24..
//

import Combine

class SignUpViewModel: ObservableObject {
    var authenticationInteractor = AuthenticationInteractor.instance

    @Published var email = ""
    @Published var password = ""
    @Published var passwordAgain = ""
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    func signUp() {
        authenticationInteractor.signUp(email: email, password: password)
    }
}
