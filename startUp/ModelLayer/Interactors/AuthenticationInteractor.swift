//
//  AuthenticationInteractor.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 09. 26..
//

import FirebaseAuth
import Combine
import CoreImage

class AuthenticationInteractor: ObservableObject {
    static let instance = AuthenticationInteractor()
        
    @Published var session: UserSession = UserSession(isUserLoggedIn: false, user: nil)
    
    var authStateListener: AuthStateDidChangeListenerHandle?
    
    func listen() {
        authStateListener = Auth.auth().addStateDidChangeListener({ auth, user in
            if let user = user {
                self.session = UserSession(
                    isUserLoggedIn: true,
                    user: User(userId: user.uid, email: user.email)
                )
            } else {
                self.session = UserSession(isUserLoggedIn: false, user: nil)
            }
        })
    }

    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    func signInAnonimously() {
        Auth.auth().signInAnonymously() { authResult, error in
            if let authResult = authResult {
                print("FIREBASE_USERID: \(authResult.user.uid)")
            }
            
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password)
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.session = UserSession(isUserLoggedIn: false, user: nil)
            return
        } catch {
            return
        }
    }
    
    func unbind() {
        if let authStateListener = authStateListener {
            Auth.auth().removeStateDidChangeListener(authStateListener)
        }
    }
}

struct UserSession {
    var isUserLoggedIn: Bool
    var user: User?
}
