//
//  AppViewModel.swift
//  LinkUp
//
//  Created by Sardorbek Saydamatov on 13/11/24.
//

import Foundation
import SwiftUI

enum AppView {
    case launchScreen
    case enterPhoneNumber
    case tabView
}

class AppViewModel: ObservableObject {
    @Published var currentView: AppView = .launchScreen

    init() {
        checkLoginStatus()
    }
    
    private func checkLoginStatus() {
        let isLoggedIn = false
        withAnimation {
            currentView = isLoggedIn ? .tabView : .launchScreen
        }
    }
    
    func logIn() {
        withAnimation {
            currentView = .tabView
        }
    }
    
    func logOut() {
        withAnimation {
            currentView = .enterPhoneNumber
        }
    }
}
