//
//  LinkUpApp.swift
//  LinkUp
//
//  Created by Sardorbek Saydamatov on 11/11/24.
//

import SwiftUI

@main
struct LinkUpApp: App {
    @StateObject private var appViewModel = AppViewModel()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(appViewModel)
        }
    }
}
