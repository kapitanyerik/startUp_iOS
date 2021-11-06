//
//  AllIdeasViewBuilder.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 05. 12..
//

import SwiftUI

@available(iOS 15.0, *)
enum AllIdeasViewBuilder {
    static func makeAllIdeasView() -> some View {
        let viewModel = AllIdeasViewModel()
        return AllIdeasView(viewModel: viewModel)
    }
}
