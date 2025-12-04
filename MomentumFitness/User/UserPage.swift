//  SPDX-License-Identifier: AGPL-3.0-or-later
//
//  AuthView.swift
//  MomentumFitness
//
//  Created by Matheus De Oliveira Boscariol on 2025-11-18.
//

import SwiftUI
import KeychainSwift

struct UserPage: View {
    
    //@FocusState private var emailFieldIsFocused: Bool = false
    let mainGradient = LinearGradient(colors: [
        Color(red: 0.22, green: 0.51, blue: 0.843),
        Color(red: 0.059, green: 0.8, blue: 0.565)],
                                      startPoint: .leading,
                                      endPoint: .trailing)
    
    var body: some View {
        
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        ScrollView{
            
            VStack{
                ZStack{
                    VStack{
                        Image(.userPageHeader)
                        Spacer()
                    }
                    VStack{
                        Spacer(minLength: height * 0.08)
                        HStack{
                            Spacer(minLength:width * 0.12)
                            Button(action: {
                                
                            }){
                                Image(systemName: "arrowshape.backward.circle.fill")
                                    .font(.custom("", size: 32))
                                    .foregroundStyle(.white)
                            }
                            Spacer(minLength: width * 0.88)
                        }
                        Spacer(minLength: height * 0.025)
                        Text("{username}")
                            .font(.custom("Quicksand", size: 42))
                            .foregroundStyle(.white)
                        Spacer(minLength: height * 0.04)
                        Circle()
                            .stroke(Color(hex: "1d2739"), lineWidth: 12)
                            .frame(width: width * 0.225)
                            .shadow(radius: 10)
                            .overlay(
                                Circle()
                                    .foregroundStyle(Color(hex: "172031"))
                            )
                        Spacer(minLength: height * 0.03)
                        VStack{
                            HStack{
                                VStack{
                                    Text("{##} friends").foregroundStyle(.white).font(.custom("Quicksand", size: 22))
                                        .fontWeight(.bold)
                                    
                                }.padding(.leading, width * 0.11)
                                Spacer()
                                VStack{
                                    Text("{##} day steak").foregroundStyle(.white).font(.custom("Quicksand", size: 22))
                                        .fontWeight(.bold)
                                    
                                }.padding(.trailing, width * 0.11)
                            }
                            Spacer(minLength: height * 0.01)
                            HStack{
                                VStack{
                                    
                                    Text("{##} following").foregroundStyle(.white).font(.custom("Quicksand", size: 22))
                                        .fontWeight(.bold)
                                    
                                }.padding(.leading, width * 0.11)
                                Spacer()
                                VStack{
                                    
                                    Text("{##} gems").foregroundStyle(.white).font(.custom("Quicksand", size: 22))
                                        .fontWeight(.bold)
                                    
                                }.padding(.trailing, width * 0.11)
                            }
                            Spacer(minLength: height * 0.01)
                            HStack{
                                VStack{
                                    
                                    Text("{##} followers").foregroundStyle(.white).font(.custom("Quicksand", size: 22))
                                        .fontWeight(.bold)
                                    
                                }.padding(.leading, width * 0.11)
                                Spacer()
                                VStack{
                                    
                                    Text("{##} posts").foregroundStyle(.white).font(.custom("Quicksand", size: 22))
                                        .fontWeight(.bold)
                                    
                                }.padding(.trailing, width * 0.11)
                            }
                        }
                    }
                }
                
            }
        }.ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(colors: [
                    Color(red: 0.059, green: 0.055, blue: 0.102),
                    Color(red: 0.039, green: 0.082, blue: 0.125)],
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing))
    }

}

#Preview {
    UserPage()
}
