//
//  OverviewView.swift
//  MomentumFitness
//
//  Created by Matheus De Oliveira Boscariol on 2025-11-16.
//

import SwiftUI

struct OverviewView: View {
    
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
            // --- CHECK IN ---
            Button(action: {
                
            }){
                ZStack{
                    RoundedRectangle(cornerRadius: 31)
                        .fill(mainGradient)
                        .frame(width: width * 0.875, height: height * 0.18) // Change height to .17 and correct spacing based on the changes
                        .shadow(color: Color(hex: "3782D6"), radius: 5)
                    HStack{
                        Spacer()
                        VStack(alignment: .leading, spacing: 0){
                            Text("100 gems")
                                .font(.custom("Quicksand", size: 18))
                                .foregroundStyle(.white)
                                .lineSpacing(0)
                                .padding(.vertical, 0)
                            Text("check in")
                                .font(.custom("Quicksand", size: 40))
                                .foregroundStyle(.white)
                                .lineSpacing(0)
                                .padding(.top, 2)
                            Text("now")
                                .font(.custom("Quicksand", size: 40))
                                .foregroundStyle(.white)
                                .lineSpacing(0)
                                .padding(.vertical, -15)
                                .padding(.bottom)
                        }
                        
                        
                        Spacer(minLength: width*0.01)
                        ZStack{
                            RoundedRectangle(cornerRadius: 50).fill(.white)
                                .frame(width: width * 0.275, height: height * 0.1)
                                .shadow(radius: 10)
                            Image(systemName: "checkmark")
                                .font(.system(size: 50, weight: .black))
                                .foregroundStyle(mainGradient.shadow(.inner(radius: 3)))
                        }
                        Spacer()
                    }
                }
            }//.buttonStyle(SoftFadeButtonStyle())
            
            
        }.background(.clear)
    }
}

struct SoftFadeButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.7 : 1)
            .animation(.easeOut(duration: 0.12), value: configuration.isPressed)
    }
}


#Preview {
    OverviewView()
}
