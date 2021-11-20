//
//  AllIdeasSectionView.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 05. 12..
//

import SwiftUI

struct AllIdeasSectionView: View {
    @ObservedObject var viewModel: AllIdeasSectionViewModel
    
    @State var navigateToAllIdeasView = false
    
    init(viewModel: AllIdeasSectionViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("The list of your all ideas")
                    .bold()
                    .padding(.vertical)
                Spacer()
            }
            HStack {
                Spacer()
                Button {
                    self.navigateToAllIdeasView = true
                } label: {
                    PositiveButton(text: "show")
                }
            }
            
            NavigationLink (destination: viewModel.navigateToAllIdeasView(), isActive: $navigateToAllIdeasView) {
                EmptyView()
            }
        }
        .modifier(GlassModule())
        .padding()
    }
}
