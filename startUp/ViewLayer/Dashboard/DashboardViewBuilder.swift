//
//  DashboardViewBuilder.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 05. 12..
//

import SwiftUI

enum DashboardViewBuilder {
    @available(iOS 15.0, *)
    static func makeDashboardView() -> some View {
        let viewModel = DashboardViewModel()
        return DashboardView(viewModel: viewModel)
    }
}
