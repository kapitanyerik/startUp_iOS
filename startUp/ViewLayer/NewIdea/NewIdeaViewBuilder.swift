//
//  NewIdeaViewBuilder.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 05. 12..
//

import SwiftUI

enum NewIdeaViewBuilder {
    static func makeNewIdeaView(
        title: Binding<String>
    ) -> some View {
        let viewModel = NewIdeaViewModel(title: title)
        return NewIdeaView(viewModel: viewModel)
    }
}
