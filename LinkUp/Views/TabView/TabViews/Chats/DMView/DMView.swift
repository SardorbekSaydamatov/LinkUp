//
//  DMView.swift
//  LinkUp
//
//  Created by Sardorbek Saydamatov on 18/11/24.
//

import SwiftUI

struct DMView: View {
    @State private var messages: [Message] = [
        Message(text: "Hi there!", isSentByUser: false),
        Message(text: "Hello! How are you?", isSentByUser: true)
    ]
    @State private var newMessage: String = ""
    var accentColor = Color("AccentColor")
    
    var body: some View {
        VStack {
            messageList
            inputAndSendButton
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationTitle("Chat")
        .navigationBarTitleDisplayMode(.inline)
    }
}


#Preview {
    DMView()
}


extension DMView {
    private var messageList: some View {
        ScrollViewReader { proxy in
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(messages) { message in
                        MessageBubbleView(message: message)
                    }
                    .padding(.horizontal)
                    .onChange(of: messages) {
                        if let lastMessage = messages.last {
                            proxy.scrollTo(lastMessage.id, anchor: .bottom)
                        }
                    }
                }
            }
            .scrollDismissesKeyboard(.immediately)
        }
    }
    
    private var inputAndSendButton: some View {
        HStack {
            TextField("Type a message...", text: $newMessage, axis: .vertical)
                .lineLimit(1...5)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 6)
                        .foregroundStyle(.secondary.opacity(0.2))
                )
            
            Button(action: sendMessage) {
                Image(systemName: "paperplane.fill")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(newMessage.isEmpty ? accentColor.opacity(0.5) : accentColor)
                    .frame(width: 24, height: 24)
            }
            .disabled(newMessage.isEmpty)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
    
    // MARK: Helper methods
    private func sendMessage() {
        guard !newMessage.isEmpty else { return }
        messages.append(Message(text: newMessage, isSentByUser: true))
        newMessage = ""
    }
}
