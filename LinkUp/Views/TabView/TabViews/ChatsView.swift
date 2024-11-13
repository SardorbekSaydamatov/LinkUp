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
    @State private var contacts = [
            Contact(name: "Alice"),
            Contact(name: "Bob"),
            Contact(name: "Charlie"),
            Contact(name: "David"),
            Contact(name: "Eve")
        ]
        
        var filteredContacts: [Contact] {
            // Filter the contacts based on the search text
            if searchText.isEmpty {
                return contacts
            } else {
                return contacts.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            }
        }
    var body: some View {
        NavigationStack {
            VStack {
                List(filteredContacts) { contact in
                    Text(contact.name)
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
                    .scaledToFit()
                    .frame(width: 22, height: 22)
            }
            
            Button {
                
            } label: {
                Image("filterChat")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26, height: 26)
            }
        }
    }
}
