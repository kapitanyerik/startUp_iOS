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
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        
        return ZStack {
            Background()
                .edgesIgnoringSafeArea(.all)
            
            List {
                ForEach(viewModel.ideas) { idea in
                    IdeaCardView(viewModel: IdeaCardViewModel(idea: idea))
                        .frame(idealHeight: 160)
                        .listRowBackground(VisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial)))
                        .padding()
                }
                .onDelete(perform: delete)
            }
            .listRowSeparator(.hidden)
            .onAppear { viewModel.loadIdeas() }
        }
    }
    
    private func delete(at offsets: IndexSet) {
        offsets.map { viewModel.ideas[$0] }.forEach(viewModel.remove)
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}
