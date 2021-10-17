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
        VStack (alignment: .leading) {
            HStack {
                Text("your last idea")
                    .padding(.horizontal)
                    .padding(.top)
                Spacer()
            }
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.4), lineWidth: 1)
                .padding(.top)
                .padding(.horizontal)
                .frame(height: 240)
                .overlay(
                    VStack {
                        Text(viewModel.lastIdea?.title ?? "")
                            .font(.title2)
                            .padding()
                        Text(viewModel.lastIdea?.shortDescription ?? "")
                            .font(.body)
                            .lineLimit(3)
                            .padding()
                    }
                    .padding()
                )
            HStack (alignment: .bottom, spacing: 32, content: {
                StatusIndicator(status: viewModel.lastIdea?.state.creation ?? Status.notStarted)
                StatusIndicator(status: viewModel.lastIdea?.state.internalChallenging ?? Status.notStarted)
                StatusIndicator(status: viewModel.lastIdea?.state.challenging ?? Status.notStarted)
                Spacer()
            })
            .padding(.horizontal)
            .padding(.leading)
        }
        .onAppear { viewModel.loadLastIdea() }
    }
}

struct StatusIndicator: View {
    var status: Status = .notStarted
    
    var body: some View {
        VStack {
            StatusIndicatorTwine()
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.6), style: StrokeStyle(lineCap: .round))
                .frame(width: 20, height: 20)
            Circle()
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.8))
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
                return Image(systemName: "seal").foregroundColor(.blue)
            }
            case .pending: do {
                return Image(systemName: "seal.fill").foregroundColor(.blue)
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
