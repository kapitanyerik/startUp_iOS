//
//  NewIdeaViewModel.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 05. 07..
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

class NewIdeaViewModel: ObservableObject {
    
    var title: Binding<String>
    @Published var shortDescription: String = ""
    @Published var description: String = ""
    
    @Published var descriptionFieldIsVisible: Bool = false
    
    init(title: Binding<String>) {
        self.title = title
    }
    
    func createNewIdea() {
        var ideaToCreate = Idea()
        
        ideaToCreate.title = self.title.wrappedValue
        self.title.wrappedValue = ""
        
        ideaToCreate.shortDescription = self.shortDescription
        ideaToCreate.state.creation = Status.successful
        ideaToCreate.state.internalChallenging = Status.pending
        
        IdeaInteractor.instance.createNewIdea(newIdea: ideaToCreate)
    }
    
    func navigateToDashboardView() -> some View {
        return DashboardViewBuilder.makeDashboardView()
    }
}
