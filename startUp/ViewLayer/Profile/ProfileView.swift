//
//  ProfileView.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 10. 03..
//

import SwiftUI
import FirebaseStorage

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
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

struct ProfilePictureAndNameModule: View {
    @ObservedObject var viewModel: ProfileViewModel
    @ObservedObject var interactor = ProfileInteractor.instance
    
    @State private var profilePicture: Image?
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        VStack {
            ZStack (alignment: .bottomTrailing) {
                if (profilePicture != nil) {
                    profilePicture?
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .padding()
                } else {
                    Image("anonymusProfile")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .padding()
                }
                
                Button {
                    showingImagePicker = true
                } label: {
                    Image(systemName: "pencil.circle.fill")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .foregroundColor(.white)
                        .offset(x: -16, y: -16)
                        .shadow(color: .gray, radius: 5, x: 5, y: 5)
                }
            }
            
            Text(viewModel.email)
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity)
                .padding()
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImageFromLocal) {
            ImagePicker(image: $inputImage)
        }
        .onAppear {
            self.profilePicture = interactor.profilePicture
        }
    }
    
    func loadImageFromLocal() {
        guard let inputImage = inputImage else { return }
        profilePicture = Image(uiImage: inputImage)
        interactor.uploadImage(image: inputImage)
    }
}

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
