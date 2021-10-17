//
//  CardView.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 03. 31..
//

import SwiftUI

struct IdeaCardView: View {
    @ObservedObject var viewModel: IdeaCardViewModel
    
    init(viewModel: IdeaCardViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.4), lineWidth: 1)
            .frame(height: 200)
            .overlay(
                VStack {
                    Text(viewModel.idea.title)
                        .font(.title2)
                        .padding()
                    Text(viewModel.idea.shortDescription)
                        .font(.body)
                        .lineLimit(3)
                        .padding()
                }
            )
            .padding()
    }
}
