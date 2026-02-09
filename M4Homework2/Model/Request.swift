//
//  Request.swift
//  M4Homework2
//
//  Created by Oleg Konstantinov on 09.02.2026.
//

import Foundation

struct Request: Encodable {
    let contents: [Content]
}

struct Content: Encodable {
    let parts: [Part]
}

struct Part: Encodable {
    let text: String
}
