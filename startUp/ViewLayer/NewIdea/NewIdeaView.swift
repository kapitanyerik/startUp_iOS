//
//  FormView.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 03. 31..
//

import SwiftUI

@available(iOS 15.0, *)
struct NewIdeaView: View {
    @ObservedObject var viewModel: NewIdeaViewModel
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
            
    var body: some View {
        ZStack {
            Background()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                TextField("title", text: $viewModel.title)
                    .disableAutocorrection(true)
                    .modifier(GlassField())
                    .padding()
                
                MultiLineGlassField(text: $viewModel.shortDescription, placeholder: "short description")
                    .padding()
                
                Toggle("Show longer description", isOn: $viewModel.descriptionFieldIsVisible)
                    .padding()
                
                if viewModel.descriptionFieldIsVisible {
                    MultiLineGlassField(text: $viewModel.description, placeholder: "longer description")
                        .padding()
                }
                
                HStack {
                    Spacer()
                    Button {
                        viewModel.createNewIdea()
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        PositiveButton(text: "save")
                    }
                    .disabled(self.viewModel.title.isEmpty || self.viewModel.shortDescription.isEmpty)
                }
            }
            .modifier(GlassModule())
            .padding()
        }
    }
}
