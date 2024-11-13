//
//  TabView.swift
//  LinkUp
//
//  Created by Sardorbek Saydamatov on 12/11/24.
//

import SwiftUI

struct TabView: View {
    @State private var selectedTab = 1
    
    var body: some View {
            SwiftUI.TabView(selection: $selectedTab) {
                ContactsView()
                    .tabItem {
                        Text("Contacts")
                        Image(systemName: "person.2")
                    }
                    .tag(0)
                
                ChatsView()
                    .tabItem {
                        Text("Chats")
                        Image(systemName: "bubble")
                    }
                    .tag(1)
                
                MoreView()
                    .tabItem {
                        Text("More")
                        Image(systemName: "ellipsis")
                    }
                    .tag(2)
            }
        }
}

#Preview {
    TabView()
}
