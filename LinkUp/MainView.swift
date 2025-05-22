//
//  ContentView.swift
//  LinkUp
//
//  Created by Sardorbek Saydamatov on 11/11/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    
    var body: some View {
        Group {
            if appViewModel.currentView == .launchScreen {
                LaunchScreen()
                    .transition(.scale)
            } else if appViewModel.currentView == .enterPhoneNumber {
                NavigationStack {
                    EnterPhoneNumberView()
                        .transition(.scale)
                }
            } else {
                TabView()
                    .transition(.slide)
            }
        }
        .animation(.easeInOut(duration: 0.2), value: appViewModel.currentView)
    }
}

#Preview {
    MainView()
}
