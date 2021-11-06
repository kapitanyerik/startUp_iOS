//
//  SwiftUIView.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 04. 29..
//

import SwiftUI

@available(iOS 15.0, *)
struct NewIdeaSectionView: View {
    @ObservedObject var viewModel: NewIdeaSectionViewModel
    
    @State var navigateToNewIdeaView = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Have you got a new idea?")
                    .bold()
                    .padding(.top)
                Spacer()
            }
            TextField("title", text: $viewModel.title)
                .disableAutocorrection(true)
                .modifier(GlassField())
                .padding()
            
            HStack {
                Spacer()
                
                Button {
                    viewModel.title = ""
                } label: {
                    GlassButton(text: "cancel", maxWidth: 80)
                }
                
                Button(action: {
                    self.navigateToNewIdeaView.toggle()
                }) {
                    PositiveButton(text: "next")
                }
            }
            NavigationLink (destination: viewModel.navigateToNewIdeaView(title: viewModel.title), isActive: $navigateToNewIdeaView) {
                EmptyView()
            }
        }
        .modifier(GlassModule())
        .padding()
        .onAppear {
            viewModel.title = ""
        }
    }
}
