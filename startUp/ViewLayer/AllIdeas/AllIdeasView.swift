//
//  MyIdeasListView.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 03. 31..
//

import SwiftUI

@available(iOS 15.0, *)
struct AllIdeasView: View {
    @ObservedObject var viewModel: AllIdeasViewModel
    
    var body: some View {
        ZStack {
            Background()
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    ForEach(viewModel.ideas) { idea in
                        IdeaCardView(viewModel: IdeaCardViewModel(idea: idea))
                    }
                    .onDelete(perform: delete)
                    
                    Spacer()
                }
            }
        }
        .onAppear { viewModel.loadIdeas() }
    }
    
    private func delete(at offsets: IndexSet) {
        offsets.map { viewModel.ideas[$0] }.forEach(viewModel.remove)
    }
}
