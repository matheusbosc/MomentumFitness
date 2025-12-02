//  SPDX-License-Identifier: AGPL-3.0-or-later
//
//  NavigationMenu.swift
//  MomentumFitness
//
//  Created by Matheus De Oliveira Boscariol on 2025-11-28.
//

import SwiftUI

struct NavigationMenu: View {
    
    @Binding var isMenuOpened: Bool
    @Binding var currentPage: Page
    
    let mainGradient = LinearGradient(colors: [
        Color(red: 0.22, green: 0.51, blue: 0.843),
        Color(red: 0.059, green: 0.8, blue: 0.565)],
                                      startPoint: .leading,
                                      endPoint: .trailing)
    
    var body: some View {
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        ZStack{
            RoundedRectangle(cornerRadius: 50)
                .fill(Color(hex: "172031"))
                .frame(width: .infinity, height: .infinity)
                .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .strokeBorder(Color(hex: "1F293C"), lineWidth: 6).offset(y: -10).padding(.bottom, -10)
                        )
                .ignoresSafeArea(edges: .top)
                .padding(.bottom, height * 0.1)
                .offset(y: -10)
            
            VStack{
                Spacer()
                
                Circle()
                    .frame(width: width * 0.2)
                    .onTapGesture {
                        currentPage = .user
                    }
                Text("{firstname} {lastname}")
                    .font(.custom("Quicksand", size: 32))
                    .foregroundStyle(mainGradient)
                
                Spacer(minLength: width * 0.08)
                
                Text("home")
                    .font(.custom("Quicksand", size: 28))
                    .foregroundStyle(currentPage == .home ? mainGradient : LinearGradient(colors: [.white, .white], startPoint: .top, endPoint: .bottom))
                    .padding(.bottom, 0.1)
                    .onTapGesture {
                        currentPage = .home
                    }
                Text("search")
                    .font(.custom("Quicksand", size: 28))
                    .foregroundStyle(currentPage == .search ? mainGradient : LinearGradient(colors: [.white, .white], startPoint: .top, endPoint: .bottom))
                    .padding(.bottom, 0.1)
                    .onTapGesture {
                        currentPage = .search
                    }
                Text("friends")
                    .font(.custom("Quicksand", size: 28))
                    .foregroundStyle(currentPage == .friends ? mainGradient : LinearGradient(colors: [.white, .white], startPoint: .top, endPoint: .bottom))
                    .padding(.bottom, 0.1)
                    .onTapGesture {
                        currentPage = .friends
                    }
                Text("cook book")
                    .font(.custom("Quicksand", size: 28))
                    .foregroundStyle(currentPage == .cookbook ? mainGradient : LinearGradient(colors: [.white, .white], startPoint: .top, endPoint: .bottom))
                    .padding(.bottom, 0.1)
                    .onTapGesture {
                        currentPage = .cookbook
                    }
                Text("routines")
                    .font(.custom("Quicksand", size: 28))
                    .foregroundStyle(currentPage == .routines ? mainGradient : LinearGradient(colors: [.white, .white], startPoint: .top, endPoint: .bottom))
                    .padding(.bottom, 0.1)
                    .onTapGesture {
                        currentPage = .routines
                    }
                Text("settings")
                    .font(.custom("Quicksand", size: 28))
                    .foregroundStyle(currentPage == .settings ? mainGradient : LinearGradient(colors: [.white, .white], startPoint: .top, endPoint: .bottom))
                    .onTapGesture {
                        currentPage = .settings
                    }
                
                Spacer(minLength:  width * 0.35)
                
                Button(action: {
                    isMenuOpened = false
                })
                {
                    Image(systemName: "line.horizontal.3.circle")
                        .font(.system(size: 50, weight: .light))
                        .foregroundColor(Color(red: 0.141, green: 0.443, blue: 0.604))
                }
                
                Spacer(minLength: width * 0.01)
            }
            .padding(.bottom, 100)
        }
    }
}

#Preview {
    NavigationMenu(isMenuOpened: .constant(true), currentPage: .constant(.home))
}
