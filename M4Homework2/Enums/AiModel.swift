//
//  AiModel.swift
//  M4Homework2
//
//  Created by Oleg Konstantinov on 09.02.2026.
//

import Foundation

enum AiModel: String, CaseIterable {
    case geminiTwoFlash = "gemini-2.5-flash"
    case geminiTwoFlashLite = "gemini-2.5-flash-lite"
    case geminiThreeFlash = "gemini-3-flash-preview"
    
    func nameModel() -> String {
        switch self {
        case .geminiTwoFlash:
            "Gemini 2.5 Flash"
        case .geminiTwoFlashLite:
            "Gemini 2.5 Flash Lite"
        case .geminiThreeFlash:
            "Gemini 3 Flash"
        }
    }
}
// Gemini 2.5 Flash gemini-2.5-flash
// Gemini 3 Flash gemini-3-flash-preview
//Gemini 2.5 Flash Lite gemini-2.5-flash-lite
