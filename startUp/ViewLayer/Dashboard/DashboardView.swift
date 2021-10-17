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
    
    @State var navigateToProfile = false
    @State var navigateToSettings = false
    
    init(viewModel: DashboardViewModel) {
        self.viewModel = viewModel
        self.authenticationInteractor.listen()
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    NewIdeaSectionView(viewModel: NewIdeaSectionViewModel())
                        .padding(.vertical)
                    
                    LastIdeaSectionView(viewModel: LastIdeaSectionViewModel())
                        .padding(.vertical)
                    
                    AllIdeasSectionView(viewModel: AllIdeasSectionViewModel())
                        .padding()
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    NavigationLink(destination: viewModel.navigateToProfile(), isActive: $navigateToProfile) {
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(Color.black)
                            .padding()
                    }
                    NavigationLink(destination: LoginView(viewModel: LoginViewModel()), isActive: $navigateToSettings) {
                        Image(systemName: "gearshape")
                            .foregroundColor(Color.black)
                            .padding()
                    }
                }
            }
            .fullScreenCover(isPresented: $authenticationInteractor.session.isUserLoggedIn.not) {
                LoginView(viewModel: LoginViewModel())
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
