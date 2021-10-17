//
//  NewIdeaSectionViewModel.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 05. 11..
//

import SwiftUI
import Combine

class NewIdeaSectionViewModel: ObservableObject {
    @Published var title: String = ""
    
    func navigateToNewIdeaView(title: Binding<String>) -> some View {
        return NewIdeaViewBuilder.makeNewIdeaView(title: title)
    }
}
