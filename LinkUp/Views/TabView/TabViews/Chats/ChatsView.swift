//
//  ChatsView.swift
//  LinkUp
//
//  Created by Sardorbek Saydamatov on 12/11/24.
//

import SwiftUI

struct Contact: Identifiable {
    var id = UUID()
    var name: String
}

struct ChatsView: View {
    @State private var searchText: String = ""
    
    let mockDate: Date = {
        var components = DateComponents()
        components.year = 2024
        components.month = 5
        components.day = 26
        return Calendar.current.date(from: components) ?? Date()
    }()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(0...10, id: \.self) { index in
                        ChatDetailsView(name: "Muhammadjon", lastName: "Tohirov", message: "asocna oasnca oaiunsc oansc ondco aosn oasnc onsc", image: UIImage(named: "photo"), date: mockDate, unreadMessage: "2", isOnline: true)
                            .padding()
                    }
                }
            }
            .searchable(text: $searchText)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Chats")
                        .font(.title3)
                        .bold()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    toolBarButtons
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ChatsView()
    }
}

extension ChatsView {
    private var toolBarButtons: some View {
        HStack {
            Button {
                
            } label: {
                Image("newChat")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 22, height: 22)
                    .foregroundStyle(Color.primary)
            }
            
            Button {
                
            } label: {
                Image("filterChat")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 26, height: 26)
                    .foregroundStyle(Color.primary)
            }
        }
    }
}
