//
//  View.ext.swift
//  M4Homework2
//
//  Created by Oleg Konstantinov on 09.02.2026.
//

import SwiftUI

extension View {
    func cornerRadius(_ size: CGFloat) -> some View {
        self
            .clipShape(RoundedRectangle(cornerRadius: size))
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}
