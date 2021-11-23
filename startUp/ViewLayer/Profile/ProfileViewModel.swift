//
//  ProfileViewModel.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 10. 03..
//

import Combine
import SwiftUI

class ProfileViewModel: ObservableObject {
    @ObservedObject var authenticationInteractor = AuthenticationInteractor.instance
    @ObservedObject var profileInteractor = ProfileInteractor.instance

    @Published var email: String = ""
    @Published var profilePicture: Image? = nil
    
    init() {
        self.email = authenticationInteractor.session.user?.email ?? "Anonymus"
        self.profilePicture = profileInteractor.profilePicture ?? Image("anonymusProfile")
    }
    
    func logout() {
        authenticationInteractor.signOut()
    }
    
    func uploadImage(image: UIImage) {
        profileInteractor.uploadImage(image: image)
    }
}
