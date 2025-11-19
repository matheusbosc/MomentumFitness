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
//  ContentView.swift
//  MomentumFitness
//
//  Created by Matheus De Oliveira Boscariol on 2025-11-16.
//

enum Tab {
    case overview
    case recommendation
    case activity
    case rewards
}

import SwiftUI

struct HomeView: View {
    
    @State private var selectedTab: Tab = .overview
    
    let mainGradient = LinearGradient(colors: [
        Color(red: 0.22, green: 0.51, blue: 0.843),
        Color(red: 0.059, green: 0.8, blue: 0.565)],
                                      startPoint: .leading,
                                      endPoint: .trailing)
    
    var body: some View {
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        ZStack{
            ScrollView(.vertical){
                
                // --- HEADER ---
                HStack{
                    Spacer()
                    // LOGO
                    Text("m")
                        .font(.custom("Quicksand", size: 64))
                        .foregroundStyle(mainGradient)
                    
                    Spacer(minLength: width * 0.6)
                    
                    // MENU
                    Button(action: {
                        
                    })
                    {
                        Image(systemName: "line.horizontal.2.decrease.circle")
                            .font(.system(size: 40, weight: .light))
                            .foregroundColor(Color(red: 0.141, green: 0.443, blue: 0.604))
                    }
                    Spacer()
                }
                
                Spacer(minLength: width * 0.1)
                
                // --- Tabs ---
                VStack(spacing: 0) {
                    ScrollView (.horizontal){
                        HStack{
                            Spacer(minLength: width*0.05)
                            tabButton(title: "overview", tab: .overview)
                            tabButton(title: "activity", tab: .activity)
                            tabButton(title: "recommendations", tab: .recommendation)
                            tabButton(title: "rewards", tab: .rewards)
                            Spacer(minLength: width*0.05)
                        }
                    }.scrollIndicators(.hidden)

                            ZStack {
                                switch selectedTab {
                                case .overview:
                                    OverviewView()
                                case .recommendation:
                                    RecommendationView()
                                case .activity:
                                    ActivityView()
                                case .rewards:
                                    RewardsView()
                                }
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                
                
            }.scrollIndicators(.hidden)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [
            Color(red: 0.059, green: 0.055, blue: 0.102),
            Color(red: 0.039, green: 0.082, blue: 0.125)],
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing))
    }
    
    private func tabButton(title: String, tab: Tab) -> some View {
            Button {
                selectedTab = tab
            } label: {
                ZStack{
                    if (selectedTab == tab){
                        RoundedRectangle(cornerRadius: 36)
                            .fill(mainGradient)
                    } else {
                        RoundedRectangle(cornerRadius: 36)
                            .fill(.clear)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 36)
                                        .strokeBorder(mainGradient, lineWidth: 3)
                                    )
                    }
                    Text(title)
                        .font(.custom("Quicksand", size: 24))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 12)
                }
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(.plain)
            .padding(8)
            .shadow(color: Color(hex: "3782D6"), radius: 5)
        
        
        }
}


#Preview {
    HomeView()
}
