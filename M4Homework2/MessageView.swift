//
//  MessageView.swift
//  M4Homework2
//
//  Created by Oleg Konstantinov on 09.02.2026.
//

import SwiftUI

struct MessageView: View {
    var message: ChatMessage
    var body: some View {
        
        HStack {
            if message.author == .me {
                Spacer()
            }
            Text(message.text)
                .font(message.author == .me ? .system(size: 16, weight: .semibold) : .system(size: 16, weight: .medium))
                .padding(10)
                .background(message.author == .me ? .gray.opacity(0.4) : .clear)
                .cornerRadius(12)
            if message.author == .ai {
                Spacer()
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    MessageView(message: ChatMessage(text: "It learns patterns from data to make predictions or decisions.", author: .me, date: Date()))
}
