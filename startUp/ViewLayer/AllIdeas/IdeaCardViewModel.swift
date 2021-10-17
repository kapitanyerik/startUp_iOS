//
//  IdeaCardViewModel.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 03. 31..
//

import Combine

class IdeaCardViewModel: ObservableObject, Identifiable {
    @Published var idea: Idea
    
    init(idea: Idea) {
        self.idea = idea
    }
}
