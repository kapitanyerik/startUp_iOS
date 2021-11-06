//
//  NavigationAppearance.swift
//  startUp
//
//  Created by Erik Kapitány on 2021. 10. 23..
//

import SwiftUI

struct NavigationAppearanceModifier: ViewModifier {
    init(tintColor: UIColor?) {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 0.1)
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        if let tintColor = tintColor {
            UINavigationBar.appearance().tintColor = tintColor
        }
    }
    
    func body(content: Content) -> some View {
        content
    }
}

extension View {
    func navigationAppearance(tintColor: UIColor? = nil) -> some View {
        self.modifier(NavigationAppearanceModifier(tintColor: tintColor))
    }
}
