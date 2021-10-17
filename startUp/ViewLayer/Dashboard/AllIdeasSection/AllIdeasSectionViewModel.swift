//
//  AllIdeasSectionViewModel.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 05. 12..
//

import Combine
import SwiftUI

class AllIdeasSectionViewModel: ObservableObject {
    
    func navigateToAllIdeasView() -> some View {
        return AllIdeasViewBuilder.makeAllIdeasView()
    }
}
