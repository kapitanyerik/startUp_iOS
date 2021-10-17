//
//  LoginView.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 09. 24..
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    @State var navigateToSignUp = false
    
    var body: some View {
        if #available(iOS 15.0, *) {
            NavigationView {
                ZStack (alignment: .bottom) {
                    LinearGradient(
                        colors: [.black, Color("darkGray")],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                        .edgesIgnoringSafeArea(.all)
                    
                    Image("Asset 5")
                        .resizable()
                        .frame(width: 300, height: 380)
                        .offset(x: -40, y: -340)
                    
                    VStack {
                        VStack {
                            Text("Login")
                                .font(.largeTitle)
                                .bold()
                                .frame(maxWidth : .infinity, alignment: .leading)
                                .padding(.top)
                            
                            Text("Login to the application")
                                .font(.callout)
                                .frame(maxWidth : .infinity, alignment: .leading)
                            
                            VStack (spacing: 12) {
                                TextField("Enter email", text: $viewModel.email)
                                    .modifier(GlassField())
                                
                                SecureField("Enter password", text: $viewModel.password)
                                    .modifier(GlassField())
                            }
                            .padding()
                            
                            Button {
                                viewModel.signIn()
                            } label: {
                                Text("Login")
                                    .bold()
                                    .frame(maxWidth: .infinity, maxHeight: 50)
                                    .cornerRadius(12)
                                    .padding(.bottom, 8)
                            }
                        }
                        .modifier(GlassModule())
                        
                        VStack {
                            Button {
                                navigateToSignUp = true
                            } label: {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke()
                                    .frame(maxWidth: .infinity, maxHeight: 50)
                                    .overlay {
                                        Text("Sign up")
                                            .bold()
                                    }
                                    .padding(.bottom, 12)
                                    .padding(.top, 12)
                            }
                            
                            Button {
                                //TODO:- add action
                            } label: {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke()
                                    .frame(maxWidth: .infinity, maxHeight: 50)
                                    .overlay {
                                        Text("Forget password?")
                                            .bold()
                                    }
                                    .padding(.bottom, 12)
                            }
                            
                            Button {
                                viewModel.signInAnonimously()
                            } label: {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke()
                                    .frame(maxWidth: .infinity, maxHeight: 50)
                                    .overlay {
                                        Text("Sign in anonymously")
                                            .bold()
                                    }
                                    .padding(.bottom, 12)
                            }
                        }
                        .modifier(GlassModule())
                        
                        NavigationLink(
                            destination: SignUpView(viewModel: SignUpViewModel(email: viewModel.email, password: viewModel.password)),
                            isActive: $navigateToSignUp
                        ) {
                            EmptyView()
                        }
                    }
                    
                    Image("Asset 4")
                        .resizable()
                        .frame(width: 120, height: 160)
                        .offset(x: 120, y: -580)
                    
                }
                .navigationBarHidden(true)
                .preferredColorScheme(.dark)
            }
        }
    }
}



