//
//  EnterPhonenumberView.swift
//  LinkUp
//
//  Created by Sardorbek Saydamatov on 11/11/24.
//

import SwiftUI
import CountryPicker

struct EnterPhoneNumberView: View {
    @State private var country = Country(countryCode: "UZ")
    @State private var showCountryList: Bool = false
    @State var phoneNumber: String = ""
    @FocusState var isActive: Bool
    @State private var showOTPView: Bool = false
    var body: some View {
        VStack {
            Spacer()
            Text("")
                .frame(height: 150)
            headerSection
            Spacer()
            textFieldSection
                .padding(.bottom, 20)
            SubmitButton(title: "Continue") {
                showOTPView = true
            }
            .padding(.bottom, 50)
        }
        .padding(.horizontal)
        .sheet(isPresented: $showCountryList) {
            CountryPickerView(selectedCountry: $country)
        }
        .navigationDestination(isPresented: $showOTPView) {
            OTPView(phoneNumber: "\(country.dialingCode ?? "")\(phoneNumber)")
        }
    }
}

#Preview {
    EnterPhoneNumberView()
}


extension EnterPhoneNumberView {
    private var headerSection: some View {
        VStack {
            Text("Enter Your Phone Number")
                .font(.system(size: 24, weight: .bold))
            Text("Please confirm your country code and enter your phone number")
                .multilineTextAlignment(.center)
                .font(.system(size: 14, weight: .regular))
                .frame(width: 282, height: 48)
        }
    }
    
    private var textFieldSection: some View {
        HStack {
            RoundedRectangle(cornerRadius: 6)
                .fill(Color.secondary.opacity(0.1))
                .frame(width: 74, height: 36)
                .overlay {
                    HStack {
                        if let flag = country.flag {
                            Image(uiImage: flag)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15)
                        }
                        
                        Text(country.dialingCode ?? "")
                    }
                }
                .onTapGesture {
                    showCountryList.toggle()
                }
            
            CustomTextFieldWithKeyboard {
                YTextField(
                    text: $phoneNumber,
                    height: 36,
                    placeholder: "Phone number"
                )
                .focused($isActive)
            } keyboard: {
                CustomKeyboardView(text: $phoneNumber, isActive: $isActive)
            }
            .frame(height: 30)
        }
    }
}
