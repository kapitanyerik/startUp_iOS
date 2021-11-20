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
        ZStack {
            Background()
                .edgesIgnoringSafeArea(.all)
            
            Image("asset3")
                .resizable()
                .frame(width: 120, height: 112)
                .rotationEffect(.degrees(25))
                .offset(x: 105, y: 60)
            
            Image("asset6")
                .resizable()
                .frame(width: 100, height: 100)
                .offset(x: 125, y: -200)
            
            Image("asset1")
                .resizable()
                .frame(width: 340, height: 250)
                .offset(x: -160, y: 140)
            
            VStack {
                Text("Sign up")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth : .infinity, alignment: .leading)
                    .padding(.top)
                    .foregroundColor(Color.primary.opacity(0.4))
                
                Text("Create a new account")
                    .font(.callout)
                    .frame(maxWidth : .infinity, alignment: .leading)
                                
                VStack (spacing: 12) {
                    TextField("Enter email", text: $viewModel.email)
                        .modifier(GlassField())
                    
                    
                    SecureField("Enter password", text: $viewModel.password)
                        .modifier(GlassField())
                    
                    
                    SecureField("Re-enter password", text: $viewModel.passwordAgain)
                        .modifier(GlassField())
                }
                .padding()
                        
                Button {
                    viewModel.signUp()
                } label: {
                    Text("Sign up")
                        .bold()
                        .padding()
                }
                
            }
            .modifier(GlassModule())
            .padding()
            
            Image("asset5")
                .resizable()
                .frame(width: 200, height: 160)
                .offset(x: -70, y: -260)
        }
    }
}
