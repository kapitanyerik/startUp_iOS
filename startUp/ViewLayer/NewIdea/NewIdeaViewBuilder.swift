//
//  NewIdeaViewBuilder.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 05. 12..
//

import SwiftUI

@available(iOS 15.0, *)
enum NewIdeaViewBuilder {
    static func makeNewIdeaView(
        title: String
    ) -> some View {
        let viewModel = NewIdeaViewModel(title: title)
        return NewIdeaView(viewModel: viewModel)
    }
}
