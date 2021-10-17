//
//  MyIdeasListViewModel.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 03. 31..
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class AllIdeasViewModel: ObservableObject {
    @Published var ideas: [Idea] = []
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        IdeaInteractor.instance.$allIdeas
            .assign(to: \.ideas, on: self)
            .store(in: &cancellables)
    }
    
    func loadIdeas() {
        IdeaInteractor.instance.loadIdeas()
    }
    
    func remove(idea: Idea) {
        IdeaInteractor.instance.deleteIdea(ideaToRemove: idea)
    }
}
