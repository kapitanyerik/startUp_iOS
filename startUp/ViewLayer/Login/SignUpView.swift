//
//  LoginView.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 09. 24..
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        if #available(iOS 15.0, *) {
            VStack{
                Text("Sign up")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth : .infinity, alignment: .leading)
                    .padding(.top)
                    .foregroundColor(Color.primary.opacity(0.4))
                
                Text("Create a new account")
                    .font(.callout)
                    .frame(maxWidth : .infinity, alignment: .leading)
                
                Divider().padding()
                
                VStack (spacing: 12) {
                    TextField("Enter email", text: $viewModel.email)
                        .modifier(GlassField())
                    
                    
                    SecureField("Enter password", text: $viewModel.password)
                        .modifier(GlassField())
                    
                    
                    SecureField("Re-enter password", text: $viewModel.passwordAgain)
                        .modifier(GlassField())
                }
                .padding()
                
                Divider().padding()
                
                Text("By signing up you accept the **Terms of Service** and **Privacy Policy**")
                    .font(.footnote)
                
                Button {
                    viewModel.signUp()
                } label: {
                    ZStack {
                        Text("Sign up")
                            .bold()
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(.thickMaterial)
                            .cornerRadius(14)
                            .padding(.bottom, 8)
                    }
                }
                
            }
            .padding()
            .background(.ultraThinMaterial)
            .foregroundColor(Color.primary.opacity(0.35))
            .foregroundStyle(.ultraThinMaterial)
            .cornerRadius(35)
            .padding()
        }
    }
}
