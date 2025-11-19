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
//  OverviewView.swift
//  MomentumFitness
//
//  Created by Matheus De Oliveira Boscariol on 2025-11-16.
//

import SwiftUI

struct RecommendationView: View {
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
            Text("recommendation")
                .font(.custom("Quicksand", size: 24))
        }.background(.clear)
    }
}

#Preview {
    RecommendationView()
}
