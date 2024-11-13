//
//  Contacts.swift
//  LinkUp
//
//  Created by Sardorbek Saydamatov on 12/11/24.
//

import SwiftUI

struct ContactsView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                
            }
            .searchable(text: $searchText)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Constacts")
                        .font(.title3)
                        .bold()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color.primary)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ContactsView()
    }
}
