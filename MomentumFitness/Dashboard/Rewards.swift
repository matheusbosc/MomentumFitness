//
//  OverviewView.swift
//  MomentumFitness
//
//  Created by Matheus De Oliveira Boscariol on 2025-11-16.
//

import SwiftUI

struct RewardsView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    let mainGradient = LinearGradient(colors: [
        Color(red: 0.22, green: 0.51, blue: 0.843),
        Color(red: 0.059, green: 0.8, blue: 0.565)],
                                      startPoint: .leading,
                                      endPoint: .trailing)
    
    var body: some View {
        VStack{
            Spacer(minLength: 35)
            Text("rewards")
                .font(.custom("Quicksand", size: 24))
        }.background(.clear)
    }
}

#Preview {
    RewardsView()
}
