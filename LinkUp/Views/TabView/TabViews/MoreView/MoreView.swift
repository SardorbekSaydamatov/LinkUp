//
//  MoreView.swift
//  LinkUp
//
//  Created by Sardorbek Saydamatov on 12/11/24.
//

import SwiftUI

struct MoreView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 40) {
                    profileRow(name: "Sardorbek Saydamatov", number: "+99891 674-19-49") {
                        
                    }
                    .padding(.bottom, 20)
                    row(title: "Account", image: "person") {
                        
                    }
                    row(title: "Chats", image: "bubble") {
                        
                    }
                    .padding(.bottom, 20)
                    row(title: "Appearence", image: "sun.min") {
                        
                    }
                    row(title: "Notification", image: "bell") {
                        
                    }
                    row(title: "Privacy", image: "exclamationmark.shield") {
                        
                    }
                    row(title: "Data Usage", image: "folder") {
                        
                    }
                    Divider()
                        .padding(.horizontal)
                    row(title: "Help", image: "questionmark.circle") {
                        
                    }
                    row(title: "Invite Your Firends", image: "envelope") {
                        
                    }
                    row(title: "Logout", image: "rectangle.portrait.and.arrow.right") {
                        appViewModel.logOut()
                    }
                }
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 20)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("More")
                        .font(.title3)
                        .bold()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        MoreView()
    }
}


extension MoreView {
    
    @ViewBuilder
    func profileRow(name: String, number: String, image: UIImage? = nil, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            HStack {
                if image == nil {
                    RoundedRectangle(cornerRadius: 50)
                        .frame(width: 60, height: 60)
                        .foregroundColor(.secondary.opacity(0.1))
                        .overlay {
                            Image(systemName: "person")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                        .padding(.trailing)
                } else {
                    
                }
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Sardorbek Saydamatov")
                        .font(.system(size: 14, weight: .semibold))
                    Text("+99891 674-19-49")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 7, height: 12)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.primary)
            .padding(.horizontal)
        }
    }
    
    @ViewBuilder
    func row(title: String, image: String, action: @escaping () -> Void) -> some View {
        Button {
            action()
        } label: {
            HStack {
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                
                Text(title)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(.primary)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 7, height: 12)
                    .fontWeight(.bold)
            }
            .foregroundStyle(Color.primary)
            .padding(.horizontal)
        }
    }
}
