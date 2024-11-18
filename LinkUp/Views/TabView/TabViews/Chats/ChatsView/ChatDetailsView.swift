//
//  ChatDetailsView.swift
//  LinkUp
//
//  Created by Sardorbek Saydamatov on 13/11/24.
//

import SwiftUI

struct ChatDetailsView: View {
    var name: String = ""
    var lastName: String = ""
    var message: String = ""
    var image: UIImage? = nil //UIImage(named: "photo")
    var date: Date = Date()
    var unreadMessage: String? = nil
    var isOnline: Bool = true
    
    var formattedDate: String {
        let calendar = Calendar.current
        let dateFormatter = DateFormatter()
        if calendar.isDateInToday(date) {
            return "Today"
        } else {
            dateFormatter.dateFormat = "MM/dd"
            return dateFormatter.string(from: date)
        }
    }
    
    var body: some View {
        HStack(alignment: .top) {
            profileImage
            nameSection
            dateSection
        }
    }
}

#Preview {
    ChatDetailsView(name: "Sardorbek", lastName: "Saydamatov", message: "Good morning, did you sleep well? aiscbaisc aiscbaisc askcjbnasc asckjabsc askcb", unreadMessage: "3")
}


extension ChatDetailsView {
    private var profileImage: some View {
        ZStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay {
                        if isOnline{
                            Circle()
                                .fill(Color.green)
                                .frame(width: 12, height: 12)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 2)
                                )
                                .offset(x: 20, y: -20)
                        }
                    }
            } else {
                RoundedRectangle(cornerRadius: 16)
                    .frame(width: 48, height: 48)
                    .foregroundStyle(.blue)
                    .overlay {
                        Text("\(lastName.prefix(1))\(name.prefix(1))".uppercased())
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                        
                        if isOnline{
                            Circle()
                                .fill(Color.green)
                                .frame(width: 12, height: 12)
                                .overlay(
                                    Circle()
                                        .stroke(Color.white, lineWidth: 2)
                                )
                                .offset(x: 20, y: -20)
                        }
                    }
            }
        }
    }
    
    private var nameSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(name) \(lastName)")
                .font(.system(size: 16, weight: .semibold))
            Text(message)
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(.secondary)
                .lineLimit(1)
                .padding(.trailing)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
    
    private var dateSection: some View {
        VStack(spacing: 10) {
            Text(formattedDate)
                .font(.system(size: 10, weight: .regular))
                .foregroundStyle(.secondary)
            
            if let messages = unreadMessage {
                RoundedRectangle(cornerRadius: 40)
                    .fill(.blue.opacity(0.2))
                    .frame(width: 22, height: 20)
                    .overlay {
                        Text(messages)
                            .font(.system(size: 10, weight: .semibold))
                            .foregroundStyle(.primary)
                            .padding(4)
                    }
            }
        }
    }
}
