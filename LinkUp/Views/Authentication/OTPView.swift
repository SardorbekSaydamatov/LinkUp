//
//  OTPView.swift
//  LinkUp
//
//  Created by Sardorbek Saydamatov on 12/11/24.
//

import SwiftUI
import Combine

struct OTPView: View {
    @State private var otpDigits = ["", "", "", ""]
    @FocusState private var focusedField: Int?
    @State private var completeOTP: String = ""
    @State private var showProfileView: Bool = false
    var phoneNumber: String = ""
    
    var body: some View {
        VStack(spacing: 30) {
            headerSection
            textFieldSection
            .frame(height: 50)
            .padding(.bottom, 50)
            
            Button {
                
            } label: {
                Text("Resend Code")
                    .font(.system(size: 16, weight: .semibold))
            }
            .padding(.top, 40)
        }
        .navigationDestination(isPresented: $showProfileView) {
            SetUpProfileView()
        }
    }
}


#Preview {
    OTPView()
}


extension OTPView {
    private var headerSection: some View {
        VStack {
            Text("Enter Code")
                .font(.system(size: 24, weight: .bold))
            Text("We have sent you an SMS with the code to \(phoneNumber)")
                .font(.system(size: 14, weight: .regular))
                .multilineTextAlignment(.center)
                .frame(width: 260, height: 50)

        }
    }
    
    private var textFieldSection: some View {
        HStack(spacing: 15) {
            ForEach(0..<otpDigits.count, id: \.self) { index in
                ZStack {
                    if otpDigits[index].isEmpty {
                        Circle()
                            .fill(Color.gray.opacity(0.1))
                            .frame(width: 40, height: 40)
                    }
                    TextField("", text: $otpDigits[index])
                        .keyboardType(.numberPad)
                        .focused($focusedField, equals: index)
                        .multilineTextAlignment(.center)
                        .frame(width: 40, height: 40)
                        .background(Color.clear)
                        .foregroundColor(.clear)
                        .accentColor(.blue)
                        .onChange(of: otpDigits[index]) { _, newValue in
                            handleInput(at: index, newValue: newValue)
                        }
                    
                    if !otpDigits[index].isEmpty {
                        Text(otpDigits[index])
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.primary)
                    }
                }
                .onTapGesture {
                    focusedField = index
                    otpDigits[index] = ""
                }
            }
        }
        .onAppear {
            focusedField = 0
        }
    }
    
    // MARK: Logic methods
    private func handleInput(at index: Int, newValue: String) {
        if let lastChar = newValue.last(where: { !$0.isWhitespace }) {
            otpDigits[index] = String(lastChar)
        } else {
            otpDigits[index] = ""
        }
        
        if !otpDigits[index].isEmpty {
            if index < otpDigits.count - 1 {
                focusedField = index + 1
            } else {
                focusedField = nil
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    sendOTP()
                }
            }
        } else if otpDigits[index].isEmpty, index > 0 {
            focusedField = index - 1
        }
    }
    
    private func sendOTP() {
        completeOTP = otpDigits.joined()
        
        // TODO: Implement the actual OTP sending logic here
        print("Sending OTP: \(completeOTP)")
        showProfileView = true
    }
}
