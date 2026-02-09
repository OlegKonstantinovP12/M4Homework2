//
//  ContentView.swift
//  M4Homework2
//
//  Created by Oleg Konstantinov on 08.02.2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel(network: NetworkManager())
    
    var body: some View {
        VStack {
            //Header
            HStack {
                Text("gemini-2.5-flash")
                    .font(.system(size: 16, weight: .heavy))
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .padding(.horizontal, 16)
            //Scroll
            ScrollView {
                LazyVStack{
                    ForEach(viewModel.messages) { message in
                        MessageView(message: message)
                        if viewModel.isLoading {
                            HStack {
                                Text("Думаем")
                                    .font(.system(size: 12, weight: .light))
                                Spacer()
                            }
                            .padding(.horizontal, 16)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .bottom)
            //Textfield
            HStack(spacing: 4) {
                TextField("Введите запрос...", text: $viewModel.request)
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                    .padding(.vertical, 10)
                    .onSubmit {
                        sendRequest()
                    }
                    .overlay {
                        Capsule()
                            .stroke(lineWidth: 2)
                            .foregroundStyle(.gray)
                    }
                Button {
                    sendRequest()
                    hideKeyboard()
                    
                } label: {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .padding(10)
                        .foregroundStyle(.black)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(lineWidth: 2)
                                .foregroundStyle(.gray)
                        }
                }
                
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 10)
        }
    }
    
    private func sendRequest() {
        viewModel.sendRequest(promt: viewModel.request)
        viewModel.request = ""
        viewModel.isLoading.toggle()
    }
}

#Preview {
    ContentView()
}
