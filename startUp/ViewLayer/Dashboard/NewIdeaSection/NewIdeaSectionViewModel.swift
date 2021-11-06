//
//  NewIdeaSectionViewModel.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 05. 11..
//

import SwiftUI
import Combine

@available(iOS 15.0, *)
class NewIdeaSectionViewModel: ObservableObject {
    @Published var title: String = ""
    
    func navigateToNewIdeaView(title: String) -> some View {
        return NewIdeaViewBuilder.makeNewIdeaView(title: title)
    }
}
