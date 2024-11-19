//
//  UIView+Extensions.swift
//  LinkUp
//
//  Created by Sardorbek Saydamatov on 18/11/24.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
