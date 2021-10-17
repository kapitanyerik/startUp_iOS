//
//  IdeaRepository.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 03. 31..
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class IdeaInteractor: ObservableObject {
    private let path = "myIdeas"
    private let firestore = Firestore.firestore()
    
    private var authenticationInteractor = AuthenticationInteractor.instance
    
    @Published var allIdeas: [Idea] = []
    @Published var lastIdea: Idea? = Idea()
    
    static let instance = IdeaInteractor()
    
    private init() {}
    
    func loadIdeas() {
        guard let userId = self.authenticationInteractor.session.user?.userId else {
            return
        }
        
        firestore.collection(path)
            .order(by: "createdTime", descending: true)
            .whereField("userId", isEqualTo: userId)
            .addSnapshotListener { (snapshot, error) in
                guard let documents = snapshot?.documents else {
                    print("No documents")
                    return
                }
                self.allIdeas = documents.compactMap { document in
                    try? document.data(as: Idea.self)
                }
            }
    }
    
    func loadLastIdea() {
        guard let userId = self.authenticationInteractor.session.user?.userId else {
            return
        }
        
        firestore.collection(path)
            .order(by: "createdTime", descending: true)
            .whereField("userId", isEqualTo: userId)
            .addSnapshotListener { (snapshot, error) in
                guard let documents = snapshot?.documents else {
                    print("No documents")
                    return
                }
                self.lastIdea = documents.first.flatMap { document in
                    try? document.data(as: Idea.self)
                }
            }
    }
    
    func createNewIdea(newIdea: Idea) {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        var ideaToCreate = newIdea
        
        ideaToCreate.userId = userId
        
        do {
            _ = try firestore.collection(path).addDocument(from: ideaToCreate)
        } catch {
            fatalError("Adding myIdea failed")
        }
    }
    
    func updateIdea(ideaToUpdate: Idea) {
        guard let documentId = ideaToUpdate.id else { return }
        do {
            try firestore.collection(path).document(documentId).setData(from: ideaToUpdate)
        } catch {
            fatalError("Updating myIdea failed")
        }
    }
    
    func deleteIdea(ideaToRemove: Idea) {
        guard let documentId = ideaToRemove.id else { return }
        firestore.collection(path).document(documentId).delete { error in
            if let error = error {
                print("Unable to remove the idea:\(error.localizedDescription)")
            }
        }
    }
}
