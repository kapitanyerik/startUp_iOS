//
//  ProfileView.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 10. 03..
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        if #available(iOS 15.0, *) {
            ZStack {
                Background()
                    .edgesIgnoringSafeArea(.all)
                
                Image("asset1")
                    .resizable()
                    .frame(width: 220, height: 160)
                    .offset(x: -50, y: -300)
                
                Image("asset4")
                    .resizable()
                    .frame(width: 160, height: 160)
                    .offset(x: -80, y: 240)
                
                VStack {
                    ProfilePictureAndNameModule(viewModel: viewModel)
                        .modifier(GlassModule())
                        .padding()
                    
                    ZStack {
                        Image("asset3")
                            .resizable()
                            .frame(width: 130, height: 110)
                            .offset(x: 125, y: -145)
                        
                        ProfileButtonsModule(viewModel: viewModel)
                            .modifier(GlassModule())
                            .padding()
                    }
                }
            }
        }
    }
}

struct ProfilePictureAndNameModule: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            Image("anonymusProfile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 120)
                .clipShape(Circle())
                .padding()
            
            Text(viewModel.email)
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity)
                .padding()
        }
    }
}

@available(iOS 15.0, *)
struct ProfileButtonsModule: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            Button {
                viewModel.logout()
            } label: {
                GlassButton(text: "Edit personal data")
            }
            
            Button {
                viewModel.logout()
            } label: {
                GlassButton(text: "Change password")
            }
            
            Button {
                viewModel.logout()
            } label: {
                GlassButton(text: "Logout")
                    .padding(.bottom)
            }
        }
    }
}
