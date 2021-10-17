//
//  ProfileViewBuilder.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 10. 03..
//

import SwiftUI

enum ProfileViewBuilder {
    static func makeProfileView() -> some View {
        let viewModel = ProfileViewModel()
        return ProfileView(viewModel: viewModel)
    }
}
