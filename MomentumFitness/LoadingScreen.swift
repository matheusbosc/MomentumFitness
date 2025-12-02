//  SPDX-License-Identifier: AGPL-3.0-or-later
//
//  LoadingScreen.swift
//  MomentumFitness
//
//  Created by Matheus De Oliveira Boscariol on 2025-11-28.
//

import SwiftUI

struct LoadingScreen: View {
    
    let mainGradient = LinearGradient(colors: [
        Color(red: 0.22, green: 0.51, blue: 0.843),
        Color(red: 0.059, green: 0.8, blue: 0.565)],
                                      startPoint: .leading,
                                      endPoint: .trailing)
    
    var body: some View {
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        
        VStack{
            Text("momentum")
                .font(.custom("Quicksand", size: 58))
                .foregroundStyle(mainGradient)
            Text("fitness")
                .font(.custom("Quicksand", size: 36))
                .foregroundStyle(.white)
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [
            Color(hex: "271E55"),
                Color(hex: "0E2030")],
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing))
    }
}

#Preview {
    LoadingScreen()
}
