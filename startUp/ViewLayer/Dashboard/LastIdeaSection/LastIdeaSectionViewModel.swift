//
//  LastIdeaSectionViewModel.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 05. 12..
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class LastIdeaSectionViewModel: ObservableObject {
    @Published var lastIdea: Idea? = Idea()
    @ObservedObject var ideaInteractor = IdeaInteractor.instance
    
    init() {
        self.lastIdea = ideaInteractor.lastIdea
    }
    
    func loadLastIdea() {
        ideaInteractor.loadLastIdea()
    }
}
