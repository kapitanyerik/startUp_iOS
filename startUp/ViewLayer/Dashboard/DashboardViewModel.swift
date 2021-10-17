//
//  DashboardViewModel.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 05. 12..
//

import Combine
import SwiftUI

class DashboardViewModel: ObservableObject {
    
    func navigateToProfile() -> some View {
        return ProfileViewBuilder.makeProfileView()
    }
}
