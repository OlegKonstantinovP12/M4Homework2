//
//  NetworkManager.swift
//  M4Homework2
//
//  Created by Oleg Konstantinov on 09.02.2026.
//

import Foundation

protocol NetworkProtocol {
    func sendRequest(promt: String, model: AiModel, completion: @escaping (String) -> ())
}

class NetworkManager: NetworkProtocol {
    let apiKey = ""
    
    func sendRequest(promt: String, model: AiModel, completion: @escaping (String) -> ()) {
        guard let url = URL(string: "https://generativelanguage.googleapis.com/v1beta/models/\(model.rawValue):generateContent") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(apiKey, forHTTPHeaderField: "x-goog-api-key")
        
        let body = Request(contents: [Content(parts: [Part(text: promt)])])
        
        let httpBody = try? JSONEncoder().encode(body)
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            guard error == nil else {
                return print(error!.localizedDescription)
            }
            guard let data else { return }
            let result = try? JSONDecoder().decode(Response.self, from: data)
            completion(result?.candidates.first?.content.parts.first?.text ?? "")
        }.resume()
    }
}
