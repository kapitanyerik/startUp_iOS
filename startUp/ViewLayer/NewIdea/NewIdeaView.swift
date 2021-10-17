//
//  FormView.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 03. 31..
//

import SwiftUI

struct NewIdeaView: View {
    @ObservedObject var viewModel: NewIdeaViewModel
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
            
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.4), lineWidth: 1)
                .frame(height: 50)
                .overlay(
                    TextField("title", text: viewModel.title)
                        .padding()
                        .disableAutocorrection(true)
                )
                .padding()
            
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.4), lineWidth: 1)
                .frame(height: 120)
                .overlay(
                    TextField("short description", text: $viewModel.shortDescription)
                        .padding()
                        .disableAutocorrection(true)
                )
                .padding()
            
            Toggle("Show description field", isOn: $viewModel.descriptionFieldIsVisible)
                .padding()
            
            if viewModel.descriptionFieldIsVisible {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.4), lineWidth: 1)
                    .frame(height: 200)
                    .overlay(
                        TextField("description", text: $viewModel.description)
                            .padding()
                            .disableAutocorrection(true)
                    )
                    .padding(.horizontal)
            }
            
            HStack {
                Spacer()
                Button(action: {
                    viewModel.createNewIdea()
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.green)
                        .frame(width: 80, height: 50)
                        .overlay(
                            Text("save")
                                .foregroundColor(.white)
                        )
                        .padding()
                }
                .disabled(self.viewModel.title.wrappedValue.isEmpty || self.viewModel.shortDescription.isEmpty)
                .padding(.vertical)
            }
            Spacer()
        }
    }
}
