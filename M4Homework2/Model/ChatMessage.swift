//
//  ChatMessage.swift
//  M4Homework2
//
//  Created by Oleg Konstantinov on 09.02.2026.
//

import Foundation

struct ChatMessage: Identifiable {
    let id: String = UUID().uuidString
    let text: String
    let author: Author
    let date: Date
}
