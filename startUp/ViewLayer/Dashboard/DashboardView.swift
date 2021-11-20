//
//  ContentView.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 03. 31..
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var viewModel: DashboardViewModel
    @ObservedObject var authenticationInteractor = AuthenticationInteractor.instance
    @ObservedObject var profileInteractor = ProfileInteractor.instance
    
    @State var navigateToProfile = false
    @State var navigateToSettings = false
    
    init(viewModel: DashboardViewModel) {
        self.viewModel = viewModel
        self.authenticationInteractor.listen()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Background()
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack {
                        NewIdeaSectionView(viewModel: NewIdeaSectionViewModel())
                        
                        LastIdeaSectionView(viewModel: LastIdeaSectionViewModel())
                        
                        AllIdeasSectionView(viewModel: AllIdeasSectionViewModel())
                    }
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink(destination: viewModel.navigateToProfile(), isActive: $navigateToProfile) {
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(.white)
                            .padding()
                    }
                    NavigationLink(destination: LoginView(viewModel: LoginViewModel()), isActive: $navigateToSettings) {
                        Image(systemName: "gearshape")
                            .foregroundColor(.white)
                            .padding()
                    }
                }
            }
            .navigationAppearance(tintColor: .white)
            .fullScreenCover(isPresented: $authenticationInteractor.session.isUserLoggedIn.not) {
                LoginView(viewModel: LoginViewModel())
            }
            .onAppear {
                profileInteractor.downloadImage()
            }
        }
    }
}

extension Binding where Value == Bool {
    var not: Binding<Value> {
        Binding<Value>(
            get: { !self.wrappedValue },
            set: { self.wrappedValue = !$0 }
        )
    }
}
