//
//  startUpApp.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 03. 31..
//

import SwiftUI
import Firebase

@main
struct startUpApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            DashboardViewBuilder.makeDashboardView()
        }
    }
}
