//
//  MessagesModel.swift
//  LinkUp
//
//  Created by Sardorbek Saydamatov on 18/11/24.
//

import Foundation

struct Message: Identifiable, Equatable {
    let id = UUID()
    let text: String
    let isSentByUser: Bool
}
