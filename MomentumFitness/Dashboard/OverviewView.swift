//  SPDX-License-Identifier: AGPL-3.0-or-later
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
            CheckInButton(width: width, height: height, mainGradient: mainGradient)
            
            Spacer(minLength: 35)
            // --- DAILY PROGRESS ---
            DailyProgressWidget(width: width, height: height, mainGradient: mainGradient)
            
            
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

struct DailyProgressWidget: View {
    let width: CGFloat
    let height: CGFloat
    let mainGradient: LinearGradient
    
    var body: some View{
        Button(action: {
            
        }){
            ZStack{
                RoundedRectangle(cornerRadius: 31)
                    .fill(Color(hex: "172031").shadow(.inner(radius: 28)))
                    .frame(width: width * 0.875, height: height * 0.40)
                    .shadow(color: Color(hex: "40266CB9"), radius: 10)
                    .overlay(
                            RoundedRectangle(cornerRadius: 31)
                                .strokeBorder(Color(hex: "1F293C"), lineWidth: 7)
                            )
                HStack{
                    Spacer()
                    // Track
                    ZStack{
                        
                        // bottom Track
                        ZStack{
                            RoundedRectangle(cornerRadius: 33)
                                .frame(width: width * 0.34, height: height * 0.335)
                                .foregroundStyle(Color(hex: "35222D"))
                            RoundedRectangle(cornerRadius: 27)
                                .frame(width: width * 0.30, height: height * 0.318)
                                .foregroundStyle(Color(hex: "373E48"))
                            RoundedRectangle(cornerRadius: 21)
                                .frame(width: width * 0.26, height: height * 0.301)
                                .foregroundStyle(Color(hex: "35222D"))
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: width * 0.22, height: height * 0.284)
                                .foregroundStyle(Color(hex: "373E48"))
                        }
                        
                        // Top Track
                        ZStack{
                            RoundedRectangle(cornerRadius: 33)
                                .frame(width: width * 0.34, height: height * 0.335)
                                .foregroundStyle(Color(hex: "F05555"))
                            RoundedRectangle(cornerRadius: 27)
                                .frame(width: width * 0.30, height: height * 0.318)
                                .foregroundStyle(.white)
                            RoundedRectangle(cornerRadius: 21)
                                .frame(width: width * 0.26, height: height * 0.301)
                                .foregroundStyle(Color(hex: "F05555"))
                            RoundedRectangle(cornerRadius: 15)
                                .frame(width: width * 0.22, height: height * 0.284)
                                .foregroundStyle(.white)
                        }
                        .mask(
                                SweepMask(startAngle: .degrees(0), endAngle: .degrees(65)) // Range from 0 (small) to -360 (large)
                            )
                        .clipped()
                        
                        Image(systemName: "rectangle.fill")
                            .font(.custom("", size: 36))
                            .padding(.leading, (width * 0.34) - width * 0.097)
                            .foregroundStyle(Color(hex: "DAD9DF"))
                        
                        Image(systemName: "rectangle.pattern.checkered")
                            .font(.custom("", size: 36))
                            .padding(.leading, (width * 0.34) - width * 0.097)
                            .foregroundStyle(Color(hex: "2A2B42"))
                        
                        
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: width * 0.18, height: height * 0.267)
                            .foregroundStyle(Color(hex: "172031"))
                    }
                    
                    
                    
                    // Text
                    VStack{
                        Spacer()
                        
                        
                        Text("{cals} kcal")
                            .font(.custom("Quicksand", size: 32))
                            .fontWeight(.bold)
                            .foregroundStyle(mainGradient)
                        Text("remaining")
                            .font(.custom("Quicksand", size: 32))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                        
                        
                        
                        VStack{
                            HStack{
                                Image(systemName: "flag.checkered")
                                    .foregroundStyle(mainGradient)
                                    .font(.custom("", size: 20))
                                Text("goal: {cal} kcal")
                                    .font(.custom("Quicksand", size: 18))
                                    .foregroundStyle(.white)
                            }
                            HStack{
                                Image(systemName: "fork.knife")
                                    .foregroundStyle(.white)
                                    .font(.custom("", size: 20))
                                Text("food: {15} kcal")
                                    .font(.custom("Quicksand", size: 18))
                                    .foregroundStyle(.white)
                            }
                            HStack{
                                Image(systemName: "flame.fill")
                                    .foregroundStyle(.white)
                                    .font(.custom("", size: 20))
                                Text("burned: {15} kcal")
                                    .font(.custom("Quicksand", size: 18))
                                    .foregroundStyle(.white)
                            }
                        }.padding(.vertical, 20)
                        
                        
                        Text("remaining = goal - food + burned")
                            .font(.custom("Quicksand", size: 11))
                            .foregroundStyle(Color(hex: "556B94"))
                            .padding(.top, 50)
                        
                        
                        Spacer()
                    }.padding(.leading, -1)
                    Spacer()
                }
            }
            
        }
        .buttonStyle(.plain)
    }
}

struct CheckInButton: View {
    
    let width: CGFloat
    let height: CGFloat
    let mainGradient: LinearGradient
    
    var body: some View {
        Button(action: {
            
        }){
            ZStack{
                RoundedRectangle(cornerRadius: 31)
                    .fill(mainGradient)
                    .frame(width: width * 0.875, height: height * 0.17) // Change height to .17 and correct spacing based on the changes
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
        }.buttonStyle(.plain)
    }
}

struct SweepMask: Shape {
    var startAngle: Angle
    var endAngle: Angle

    func path(in rect: CGRect) -> Path {
        
        var sAngle = -startAngle
        var eAngle = -endAngle
        
        var path = Path()

        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) * 2

        path.move(to: center)

        path.addArc(
            center: center,
            radius: radius,
            startAngle: sAngle,
            endAngle: eAngle,
            clockwise: true
        )

        path.closeSubpath()

        return path
    }
}


#Preview {
    OverviewView()
}
