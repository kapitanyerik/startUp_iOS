//
//  ProfileViewModel.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 10. 03..
//

import Combine
import SwiftUI

class ProfileViewModel: ObservableObject {
    var authenticationInteractor = AuthenticationInteractor.instance
    @Published var email: String = ""
    
    init() {
        self.email = authenticationInteractor.session.user?.email ?? "Anonymus"
    }
    
    func logout() {
        authenticationInteractor.signOut()
    }
}
