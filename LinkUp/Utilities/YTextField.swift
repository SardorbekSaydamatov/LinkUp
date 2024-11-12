//
//  YTextField.swift
//  LinkUp
//
//  Created by Sardorbek Saydamatov on 11/11/24.
//

import SwiftUI

struct YTextField: View {
    @Binding var text: String
    var height: CGFloat = 48
    var placeholder: String = "Enter your text"
    var body: some View {
        TextField(placeholder, text: $text)
            .frame(maxWidth: .infinity)
            .frame(height: height)
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: 6)
                    .foregroundStyle(.secondary.opacity(0.1)))
            .scrollDismissesKeyboard(.immediately)
    }
}

#Preview {
    YTextField(text: .constant(""))
}
