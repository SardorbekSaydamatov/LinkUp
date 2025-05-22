//
//  MessageBubbleView.swift
//  LinkUp
//
//  Created by Sardorbek Saydamatov on 18/11/24.
//

import SwiftUI

struct MessageBubbleView: View {
    let message: Message
    
    var body: some View {
        HStack {
            if message.isSentByUser {
                Spacer()
                Text(message.text)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            } else {
                Text(message.text)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(12)
                Spacer()
            }
        }
    }
    
}

#Preview {
    MessageBubbleView(message: .init(text: "Hi there!", isSentByUser: true))
        .padding(.horizontal)
}
