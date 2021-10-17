//
//  MenuView.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 05. 07..
//

import SwiftUI

struct MenuView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var coordinator: SignInWithAppleCoordinator?
    
    var body: some View {
        VStack {
            Circle()
                .frame(minWidth: 0, idealWidth: 120, maxWidth: 120, minHeight: 0, idealHeight: 120, maxHeight: 120, alignment: .center)
                .foregroundColor(Color.blue)
                .overlay(
                    Image(systemName: "person")
                        .resizable()
                        .scaleEffect(CGSize(width: 0.4, height: 0.4))
                        .foregroundColor(.white)
                )
                .padding()
            Text("Firstname Lastname")
                .font(.title2)
                .foregroundColor(.black)
                .padding()
            Spacer()
            SignInWithAppleButton()
                .frame(height: 40)
                .padding()
                .onTapGesture {
                    self.coordinator = SignInWithAppleCoordinator()
                    if let coordinator = self.coordinator {
                        coordinator.startSignInWithAppleFlow {
                        print("You successfully signed in")
                        self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
        }
    }
}
