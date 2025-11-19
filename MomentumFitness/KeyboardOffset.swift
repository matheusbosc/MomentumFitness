/*

    Momentum Fitness 
    Copyright (C) 2025  Matheus De Oliveira Boscariol

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

*/

//
//  KeyboardOffset.swift
//  MomentumFitness
//
//  Created by Matheus De Oliveira Boscariol on 2025-11-18.
//

import SwiftUI
import Combine

struct KeyboardAdaptive: ViewModifier {
    @State private var keyboardHeight: CGFloat = 0

    func body(content: Content) -> some View {
        content
            .padding(.bottom, keyboardHeight)
            .onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0 }
    }
}

extension View {
    func keyboardAdaptive() -> some View {
        ModifiedContent(content: self, modifier: KeyboardAdaptive())
    }
}

// Publisher for keyboard height (you'll need to create this)
extension Publishers {
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .map { notification in
                (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
            }
            .merge(with: NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
                .map { _ in 0 }
            )
            .eraseToAnyPublisher()
    }
}
