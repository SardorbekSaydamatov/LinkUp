//
//  ChatsView.swift
//  LinkUp
//
//  Created by Sardorbek Saydamatov on 12/11/24.
//

import SwiftUI

struct ChatsView: View {
    @State private var searchText: String = ""
    var body: some View {
        VStack {
            
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
