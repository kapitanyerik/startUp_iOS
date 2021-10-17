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
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        IdeaInteractor.instance.$lastIdea
            .assign(to: \.lastIdea, on: self)
            .store(in: &cancellables)
    }
    
    func loadLastIdea() {
        IdeaInteractor.instance.loadLastIdea()
    }
}
