//
//  ContentViewModel.swift
//  M4Homework2
//
//  Created by Oleg Konstantinov on 09.02.2026.
//

import Foundation
import Combine

class ContentViewModel: ObservableObject {
    let network: NetworkProtocol
    init(network: NetworkProtocol) {
        self.network = network
    }
    
    @Published var messages: [ChatMessage] = []
    @Published var request: String = ""
    @Published var isLoading: Bool = false
    @Published var model: AiModel = .geminiTwoFlash

    func sendRequest(promt: String) {
        guard !promt.isEmpty else { return }
        
        messages.append(ChatMessage(text: promt, author: .me, date: Date()))
        
        network.sendRequest(promt: promt, model: model) { [weak self] response in
            guard let self else { return }
            DispatchQueue.main.async {
                self.messages.append(ChatMessage(text: response, author: .ai, date: Date()))
                self.isLoading.toggle()
            }
        }
    }
}
