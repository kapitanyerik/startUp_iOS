//
//  AllIdeasSectionViewModel.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 05. 12..
//

import Combine
import SwiftUI

@available(iOS 15.0, *)
class AllIdeasSectionViewModel: ObservableObject {
    
    func navigateToAllIdeasView() -> some View {
        return AllIdeasViewBuilder.makeAllIdeasView()
    }
}
