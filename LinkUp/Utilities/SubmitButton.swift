//
//  YRoundedButton.swift
//  LinkUp
//
//  Created by Sardorbek Saydamatov on 11/11/24.
//

import SwiftUI

struct SubmitButton: View {
    var title: String
    var accentColor: Color = Color("AccentColor")
    var isIDisabled: Bool = false
    var onClick: () -> Void
    
    var body: some View {
        Button {
            onClick()
        } label: {
            Text(title)
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity)
                .frame(height: 52)
                .background(accentColor.opacity(isIDisabled ? 0.6 : 1))
                .clipShape(Capsule())
        }
        .disabled(isIDisabled)
    }
}

//#Preview {
//    YRoundedButton(text: "Continue")
//}
