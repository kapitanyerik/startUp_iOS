//
//  ExistingIdeasSectionView.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 05. 06..
//

import SwiftUI

struct LastIdeaSectionView: View {
    @ObservedObject var viewModel: LastIdeaSectionViewModel
    
    init(viewModel: LastIdeaSectionViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("Your last idea")
                        .bold()
                        .padding(.vertical)
                    Spacer()
                }
                
                VStack {
                    Text(viewModel.lastIdea?.title ?? "")
                        .font(.title2)
                        .bold()
                    Text(viewModel.lastIdea?.shortDescription ?? "")
                        .font(.body)
                        .lineLimit(3)
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
            .modifier(GlassModule())
            .padding(.top)
            .padding(.horizontal)
            
            HStack (spacing: 60) {
                StatusIndicator(status: viewModel.lastIdea?.state.creation ?? Status.notStarted)
                StatusIndicator(status: viewModel.lastIdea?.state.internalChallenging ?? Status.notStarted)
                StatusIndicator(status: viewModel.lastIdea?.state.challenging ?? Status.notStarted)
            }
            .padding(.bottom)
        }
        .onAppear { viewModel.loadLastIdea() }
    }
}

struct StatusIndicator: View {
    var status: Status = .notStarted
    
    var body: some View {
        VStack {
            StatusIndicatorTwine()
                .stroke(.white.opacity(0.2), style: StrokeStyle(lineCap: .round))
                .frame(width: 20, height: 20)
            Circle()
                .stroke(.white.opacity(0.35))
                .frame(width: 40, height: 40)
                .overlay(
                    getIconByStatus(status: status)
                )
        }
    }
    
    struct StatusIndicatorTwine: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            
            return path
        }
    }
    
    func getIconByStatus(status: Status) -> some View {
        switch status {
        case .notStarted: do {
            return Image(systemName: "seal").foregroundColor(.white.opacity(0.5))
        }
        case .pending: do {
            return Image(systemName: "seal.fill").foregroundColor(.white.opacity(0.5))
        }
        case .successful: do {
            return Image(systemName: "checkmark.seal.fill").foregroundColor(.green)
        }
        case .failed: do {
            return Image(systemName: "xmark.seal.fill").foregroundColor(.red)
        }
        }
    }
}
