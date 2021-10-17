//
//  SwiftUIView.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 04. 29..
//

import SwiftUI

struct NewIdeaSectionView: View {
    @ObservedObject var viewModel: NewIdeaSectionViewModel
    
    @State var navigateToNewIdeaView = false
    
    var body: some View {
        VStack {
            HStack {
                Text("have you got a new idea?")
                    .padding(.horizontal)
                    .padding(.top)
                Spacer()
            }
            TextField("title", text: $viewModel.title)
                .disableAutocorrection(true)
                .modifier(GlassField())
            HStack {
                Spacer()
                Button(action: {
                    viewModel.title = ""
                }) {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.4), lineWidth: 1)
                        .frame(width: 80, height: 50)
                        .overlay(
                            Text("cancel")
                                .foregroundColor(.gray)
                        )
                }
                Button(action: {
                    self.navigateToNewIdeaView.toggle()
                }) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.green)
                        .frame(width: 80, height: 50)
                        .overlay(
                            Text("next")
                                .foregroundColor(.white)
                        )
                        .padding(.horizontal)
                }
            }
            NavigationLink (destination: viewModel.navigateToNewIdeaView(title: $viewModel.title), isActive: $navigateToNewIdeaView) {
                EmptyView()
            }
        }
    }
}
