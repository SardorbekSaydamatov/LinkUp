//
//  Checkbox.swift
//  LinkUp
//
//  Created by Sardorbek Saydamatov on 30/04/25.
//

import SwiftUI

struct Checkbox: View {
    @State private var selectedGender: String = ""
    @State private var otherSelected: Bool = false
    let options = ["Male", "Female", "Other"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Select Gender")
                .font(.headline)
            
            ForEach(options, id: \.self) { option in
                Button(action: {
                    selectedGender = option
                    if option == "Other" {
                        otherSelected.toggle()
                        selectedGender = ""
                    }
                }) {
                    HStack {
                        if option != "Other" {
                            Image(systemName: selectedGender == option ? "largecircle.fill.circle" : "circle")
                                .foregroundColor(.yellow)
                        }
                        Text(option)
                            .foregroundColor(.primary)
                            .padding(.leading, option == "Other" ? 26 : 0)
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            YTextField(text: $selectedGender, disabled: !otherSelected)
        }
        .padding()
    }
}

#Preview {
    Checkbox()
}
