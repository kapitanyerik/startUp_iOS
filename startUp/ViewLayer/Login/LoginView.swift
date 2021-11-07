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
    
    let timerForObjectsClose = Timer.publish(every: 2, on: .main, in: .default).autoconnect()
    let timerForObjectsFar = Timer.publish(every: 4, on: .main, in: .default).autoconnect()
    
    @State var asset4_OffsetX: CGFloat = -100
    @State var asset4_OffsetY: CGFloat = -280
    
    @State var asset6_OffsetX: CGFloat = 90
    @State var asset6_OffsetY: CGFloat = 5
    
    @State var asset7_OffsetX: CGFloat = -100
    @State var asset7_OffsetY: CGFloat = -60
    
    @State var asset3_OffsetX: CGFloat = 140
    @State var asset3_OffsetY: CGFloat = -520
    
    @State var asset1_OffsetX: CGFloat = -100
    @State var asset1_OffsetY: CGFloat = -535
    
    @State var asset5_OffsetX: CGFloat = 220
    @State var asset5_OffsetY: CGFloat = -160
    
    var body: some View {
                if #available(iOS 15.0, *) {
                    NavigationView {
                        ZStack (alignment: .bottom) {
                            Background()
                                .edgesIgnoringSafeArea(.all)
        
                            Group {
                                Image("asset7")
                                    .resizable()
                                    .frame(width: 340, height: 240)
                                    .offset(x: asset7_OffsetX, y: asset7_OffsetY)
                                    .onReceive(timerForObjectsFar) { _ in
                                        withAnimation (.easeInOut(duration: 8)) {
                                            asset7_OffsetY = CGFloat.random(in: -100 ... -20)
                                        }
                                    }
                                
                                Image("asset4")
                                    .resizable()
                                    .frame(width: 130, height: 140)
                                    .offset(x: asset4_OffsetX, y: asset4_OffsetY)
                                    .onReceive(timerForObjectsClose) { _ in
                                        withAnimation (.easeInOut(duration: 5)) {
                                            asset4_OffsetX = CGFloat.random(in: -120 ... -80)
                                            asset4_OffsetY = CGFloat.random(in: -300 ... -260)
                                        }
                                    }
        
                                Image("asset6")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .offset(x: asset6_OffsetX, y: asset6_OffsetY)
                                    .onReceive(timerForObjectsClose) { _ in
                                        withAnimation (.easeInOut(duration: 5)) {
                                            asset6_OffsetX = CGFloat.random(in: 70 ... 110)
                                            asset6_OffsetY = CGFloat.random(in: -15 ... 25)
                                        }
                                    }
        
                                Image("asset3")
                                    .resizable()
                                    .frame(width: 100, height: 92)
                                    .offset(x: asset3_OffsetX, y: asset3_OffsetY)
                                    .onReceive(timerForObjectsClose) { _ in
                                        withAnimation (.easeInOut(duration: 5)) {
                                            asset3_OffsetX = CGFloat.random(in: 120 ... 160)
                                            asset3_OffsetY = CGFloat.random(in: -540 ... -500)
                                        }
                                    }
                            }
        
                            VStack {
                                LoginInputModule(viewModel: viewModel)
                                    .modifier(GlassModule())
                                    .padding()
        
                                ZStack {
                                    Image("asset1")
                                        .resizable()
                                        .frame(width: 150, height: 110)
                                        .offset(x: asset1_OffsetX, y: asset1_OffsetY)
                                        .onReceive(timerForObjectsClose) { time in
                                            withAnimation (.easeInOut(duration: 5)) {
                                                asset1_OffsetX = CGFloat.random(in: -120 ... -80)
                                                asset1_OffsetY = CGFloat.random(in: -550 ... -520)
                                            }
                                        }
        
                                    Image("asset5")
                                        .resizable()
                                        .frame(width: 180, height: 140)
                                        .offset(x: asset5_OffsetX, y: asset5_OffsetY)
                                        .onReceive(timerForObjectsClose) { _ in
                                            withAnimation (.easeInOut(duration: 5)) {
                                                asset5_OffsetX = CGFloat.random(in: 200 ... 240)
                                                asset5_OffsetY = CGFloat.random(in: -180 ... -140)
                                            }
                                        }
        
                                        LoginButtonsModule(viewModel: viewModel, navigateToSignUp: $navigateToSignUp)
                                        .modifier(GlassModule())
                                        .padding()
                                }
                            }
                            NavigationLink(
                                destination: SignUpView(viewModel: SignUpViewModel(email: viewModel.email, password: viewModel.password)),
                                isActive: $navigateToSignUp
                            ) {
                                EmptyView()
                            }
                        }
                        .navigationBarHidden(true)
                    }
                }
    }
}

struct LoginInputModule: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
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
                    .padding()
            }
        }
    }
}

struct LoginButtonsModule: View {
    @ObservedObject var viewModel: LoginViewModel
    @Binding var navigateToSignUp: Bool
    
    var body: some View {
        if #available(iOS 15.0, *) {
            VStack {
                Button {
                    navigateToSignUp = true
                } label: {
                    GlassButton(text: "Sign up")
                }
                
                Button {
                    //TODO:- add action
                } label: {
                    GlassButton(text: "Forget password?")
                }
                
                Button {
                    viewModel.signInAnonimously()
                } label: {
                    GlassButton(text: "Sign in anonimously")
                        .padding(.bottom)
                }
            }
        }
    }
}
