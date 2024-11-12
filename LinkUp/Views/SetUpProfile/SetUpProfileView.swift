//
//  SetUpProfileView.swift
//  LinkUp
//
//  Created by Sardorbek Saydamatov on 12/11/24.
//

import SwiftUI

struct SetUpProfileView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State private var selectedImage: UIImage? = nil
    @State private var isShowingImagePicker = false

    var body: some View {
        VStack(spacing: 50) {
            headerSection
            textFields
            submitButton
        }
        .padding(.horizontal)
        .sheet(isPresented: $isShowingImagePicker) {
            ImagePicker(selectedImage: $selectedImage)
        }
    }
}

#Preview {
    SetUpProfileView()
}

extension SetUpProfileView {
    private var headerSection: some View {
        RoundedRectangle(cornerRadius: 50)
            .frame(width: 100, height: 100)
            .foregroundColor(.secondary.opacity(0.1))
            .overlay {
                if let selectedImage = selectedImage {
                    Image(uiImage: selectedImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay {
                            Button {
                                self.selectedImage = nil
                            } label: {
                                Image(systemName: "trash.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(Color.red)
                                
                            }
                            .offset(x: 40, y: 40)
                            
                        }
                } else {
                    Image(systemName: "person")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 37, height: 44)
                    
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .offset(x: 40, y: 30)
                        .onTapGesture {
                            isShowingImagePicker = true
                        }
                }
            }
    }
    
    private var textFields: some View {
        VStack(spacing: 10) {
            YTextField(
                text: $firstName,
                height: 36,
                placeholder: "First name (Required)"
            )
            YTextField(
                text: $lastName,
                height: 36,
                placeholder: "Last name (Optional)"
            )
        }
    }
    
    private var submitButton: some View {
        SubmitButton(title: "Save", isIDisabled: firstName != "" ? false : true) {
            
        }
    }
}
