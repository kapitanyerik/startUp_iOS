//
//  CardView.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 03. 31..
//

import SwiftUI

@available(iOS 15.0, *)
struct IdeaCardView: View {
    @ObservedObject var viewModel: IdeaCardViewModel
    
    init(viewModel: IdeaCardViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack (alignment: .center) {
            HStack {
                Spacer()
                
                Text(viewModel.idea.title)
                    .font(.title2)
                    .bold()
                    .padding()
                
                Spacer()
            }

            Text(viewModel.idea.shortDescription)
                .font(.body)
                .lineLimit(3)
                .padding(.bottom)
        }
        .modifier(GlassModule())
    }
}
