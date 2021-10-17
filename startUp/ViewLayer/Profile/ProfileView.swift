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
                LinearGradient(
                    colors: [.black, Color("darkGray")],
                    startPoint: .top,
                    endPoint: .bottom
                )
                    .edgesIgnoringSafeArea(.all)
                
                Image("Asset 10")
                    .resizable()
                    .frame(width: 380, height: 250)
                    .offset(x: 0, y: -290)
                
                VStack {
                    VStack {
                        Image("anonymusProfile")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .padding()
                        
                        Text(viewModel.email)
                            .font(.title)
                            .frame(maxWidth: .infinity, maxHeight: 50)
                        
                    }
                    .modifier(GlassModule())
                    
                    ZStack {
                        Image("Asset 3")
                            .resizable()
                            .frame(width: 160, height: 160)
                            .offset(x: 110, y: -120)
                        
                        VStack {
                            Button {
                                viewModel.logout()
                            } label: {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke()
                                    .frame(maxWidth: .infinity, maxHeight: 50)
                                    .overlay {
                                        Text("Edit personal data")
                                            .bold()
                                    }
                                    .padding(.bottom, 12)
                                    .padding(.top, 12)
                            }
                            
                            Button {
                                viewModel.logout()
                            } label: {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke()
                                    .frame(maxWidth: .infinity, maxHeight: 50)
                                    .overlay {
                                        Text("Change password")
                                            .bold()
                                    }
                                    .padding(.bottom, 12)
                                    .padding(.top, 12)
                            }
                            
                            Button {
                                viewModel.logout()
                            } label: {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke()
                                    .frame(maxWidth: .infinity, maxHeight: 50)
                                    .overlay {
                                        Text("Logout")
                                            .bold()
                                    }
                                    .padding(.bottom, 12)
                                    .padding(.top, 12)
                            }
                        }
                        .modifier(GlassModule())
                    }
                }
            }
            .preferredColorScheme(.dark)
        }
    }
}
