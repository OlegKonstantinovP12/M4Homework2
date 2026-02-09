//
//  Response.swift
//  M4Homework2
//
//  Created by Oleg Konstantinov on 09.02.2026.
//

import Foundation


struct Response: Codable {
    let candidates: [Candidate]
}

struct Candidate: Codable {
    let content: ContentResponse
}

struct ContentResponse: Codable {
    let parts: [PartResponse]
}
struct PartResponse: Codable {
    let text: String
}

/*
 {
     "candidates": [
         {
             "content": {
                 "parts": [
                     {
                         "text": "It learns patterns from data to make predictions or decisions."
                     }
                 ],
                 "role": "model"
             },
             "finishReason": "STOP",
             "index": 0
         }
     ],
     "usageMetadata": {
         "promptTokenCount": 8,
         "candidatesTokenCount": 11,
         "totalTokenCount": 1085,
         "promptTokensDetails": [
             {
                 "modality": "TEXT",
                 "tokenCount": 8
             }
         ],
         "thoughtsTokenCount": 1066
     },
     "modelVersion": "gemini-2.5-flash",
     "responseId": "x9mJaaafDqyKvdIPppGYyQk"
 }
 */
