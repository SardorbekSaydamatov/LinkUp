//
//  LaunchScreen.swift
//  LinkUp
//
//  Created by Sardorbek Saydamatov on 11/11/24.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var getStarted: Bool = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                
                Image("launchScreen")
                
                Text("Connect easily with your family and friends over countries")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 280)
                    .padding(.top)
                
                Spacer()
                
                Text("Terms and Privacy Policy")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.secondary)
                    .padding(.bottom)
                
                SubmitButton(title: "Get Started") {
                    getStarted = true
                }
            }
            .padding(.horizontal)
            .navigationDestination(isPresented: $getStarted) {
                EnterPhoneNumberView()
                    .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    LaunchScreen()
}
