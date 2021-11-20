//
//  MyIdeasListView.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 03. 31..
//

import SwiftUI

struct AllIdeasView: View {
    @ObservedObject var viewModel: AllIdeasViewModel
    
    var body: some View {
        ZStack {
            Background()
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack {
                    ForEach(viewModel.ideas.indices, id: \.self) { indexOfIdea in
                        ZStack (alignment: .topTrailing) {
                            IdeaCardView(viewModel: IdeaCardViewModel(idea: viewModel.ideas[indexOfIdea]))
                            
                            RemoveItemButton(onDelete: delete, index: indexOfIdea)
                                .padding()
                        }
                        .padding()
                    }
                    
                    Spacer()
                }
            }
        }
        .onAppear { viewModel.loadIdeas() }
        .toolbar {
            EditButton()
                .foregroundColor(.white)
        }
    }
    
    private func delete(at offsets: IndexSet) {
        offsets.map { viewModel.ideas[$0] }.forEach(viewModel.remove)
    }
}
