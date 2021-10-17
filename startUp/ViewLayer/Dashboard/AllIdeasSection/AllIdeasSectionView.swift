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
                Text("the list of your all ideas")
                    .padding(.vertical)
                Spacer()
            }
            HStack {
                Spacer()
                Button(action: {
                    self.navigateToAllIdeasView = true
                }) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.green)
                        .frame(width: 80, height: 50)
                        .overlay(
                            Text("show")
                                .foregroundColor(.white)
                        )
                        .padding(.horizontal)
                }
                .padding(.bottom)
            }
            NavigationLink (destination: viewModel.navigateToAllIdeasView(), isActive: $navigateToAllIdeasView) {
                EmptyView()
            }
        }
    }
}
