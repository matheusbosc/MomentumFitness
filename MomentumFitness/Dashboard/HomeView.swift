//  SPDX-License-Identifier: AGPL-3.0-or-later
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
import KeychainSwift

struct HomeView: View {
    
    @State private var selectedTab: Tab = .overview
    
    @Binding var loggedIn: Bool
    @Binding var isMenuOpened: Bool
    
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
                        isMenuOpened = true
                    })
                    {
                        Image(systemName: "line.horizontal.3.circle")
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
    HomeView(loggedIn: .constant(false), isMenuOpened: .constant(false))
}
