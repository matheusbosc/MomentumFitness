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
    
    @Binding var currentPage: Page
    @Binding var lastPage: Page
    
    //@FocusState private var emailFieldIsFocused: Bool = false
    let mainGradient = LinearGradient(colors: [
        Color(red: 0.22, green: 0.51, blue: 0.843),
        Color(red: 0.059, green: 0.8, blue: 0.565)],
                                      startPoint: .leading,
                                      endPoint: .trailing)
    
    let secondGradient = LinearGradient(colors: [
        Color(hex: "153a66"),
        Color(hex: "076447")],
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
                        
                        // -------- HEADER --------
                        Spacer(minLength: height * 0.08)
                        HStack{
                            Spacer(minLength:width * 0.12)
                            Button(action: {
                                currentPage = lastPage
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
                        
                        // -------- USER STATS ----------
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
                        
                        // -------- LATEST POST --------
                        VStack{
                            HStack(content: {
                                Text("latest post")
                                    .font(.custom("Quicksand", size: 32))
                                    .foregroundStyle(.white)
                                    .fontWeight(.medium)
                                    .padding(.leading, width * 0.125)
                                Spacer()
                            })
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color(hex: "172031"))
                                    .frame(width: width * 0.875, height: height * 0.35)
                                    .shadow(color: Color(hex: "38000000"), radius: 5)
                                    .overlay(
                                            RoundedRectangle(cornerRadius: 31)
                                                .strokeBorder(Color(hex: "1F293C"), lineWidth: 7)
                                            )
                                VStack{
                                    Spacer()
                                    ZStack{
                                        Rectangle()
                                            .fill(Color(hex: "1F293C"))
                                            .frame(width: (width * 0.875) - 14, height: height * 0.145 + 7)
                                            .cornerRadius(25, corners: [.bottomLeft, .bottomRight])
                                            .padding(.bottom, 7)
                                            .padding(.top, 0)
                                        Rectangle()
                                            .fill(secondGradient)
                                            .frame(width: (width * 0.875) - 14, height: height * 0.145)
                                            .cornerRadius(25, corners: [.bottomLeft, .bottomRight])
                                            .padding(.top, 0)
                                        
                                        VStack{
                                            HStack{
                                                Text("{post title}")
                                                    .font(.custom("Quicksand", size: 30))
                                                    .foregroundStyle(.white)
                                                    .padding(.leading, width * 0.05)
                                                Spacer()
                                            }
                                            .padding(.top, 10)
                                            HStack{
                                                Text("{username}")
                                                    .font(.custom("Quicksand", size: 18))
                                                    .foregroundStyle(.white)
                                                    .padding(.leading, width * 0.05)
                                                Spacer()
                                            }
                                            Spacer()
                                            HStack{
                                                Text("{month} {day}, {year}")
                                                    .font(.custom("Quicksand", size: 18))
                                                    .foregroundStyle(.white)
                                                    .padding(.leading, width * 0.05)
                                                Spacer()
                                            }
                                            .padding(.bottom, 17)
                                        }
                                        .frame(width: (width * 0.875) - 14, height: height * 0.145 + 7)
                                    }
                                }
                            }
                            
                        }.padding(.top, height * 0.05).padding(.bottom, height * 0.05)
                        
                        // -------- RECENT ACTIVITY --------
                        VStack{
                            HStack(content: {
                                Text("recent activities")
                                    .font(.custom("Quicksand", size: 32))
                                    .foregroundStyle(.white)
                                    .fontWeight(.medium)
                                    .padding(.leading, width * 0.125)
                                Spacer()
                            })
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color(hex: "172031"))
                                    .frame(width: width * 0.875, height: height * 0.35)
                                    .shadow(color: Color(hex: "38000000"), radius: 5)
                                    .overlay(
                                            RoundedRectangle(cornerRadius: 31)
                                                .strokeBorder(Color(hex: "1F293C"), lineWidth: 7)
                                            )
                                VStack{
                                    Spacer()
                                    ZStack{
                                        VStack{
                                            Rectangle()
                                                .fill(Color(hex: "151c2b"))
                                                .frame(width: (width * 0.875) - 14, height: height * 0.0605)
                                                .cornerRadius(25, corners: [.topLeft, .topRight])
                                            Spacer()
                                            Rectangle()
                                                .fill(Color(hex: "151c2b"))
                                                .frame(width: (width * 0.875) - 14, height: height * 0.0605)
                                            Spacer()
                                            Rectangle()
                                                .fill(Color(hex: "151c2b"))
                                                .frame(width: (width * 0.875) - 14, height: height * 0.0605)
                                                .padding(.bottom, height * 0.01)
                                            Spacer()
                                            
                                        }
                                        
                                        VStack{
                                            
                                            HStack{
                                                Text("{activity}")
                                                    .padding(.leading, width * 0.15)
                                                    .font(.custom("Quicksand", size: 20))
                                                    .foregroundStyle(.white)
                                                Spacer()
                                                Text("{info}")
                                                    .padding(.trailing, width * 0.15)
                                                    .font(.custom("Quicksand", size: 20))
                                                    .foregroundStyle(.white)
                                            }.padding(.top, 10)
                                            Spacer()
                                            HStack{
                                                Text("{activity}")
                                                    .padding(.leading, width * 0.15)
                                                    .font(.custom("Quicksand", size: 20))
                                                    .foregroundStyle(.white)
                                                Spacer()
                                                Text("{info}")
                                                    .padding(.trailing, width * 0.15)
                                                    .font(.custom("Quicksand", size: 20))
                                                    .foregroundStyle(.white)
                                            }
                                            Spacer()
                                            HStack{
                                                Text("{activity}")
                                                    .padding(.leading, width * 0.15)
                                                    .font(.custom("Quicksand", size: 20))
                                                    .foregroundStyle(.white)
                                                Spacer()
                                                Text("{info}")
                                                    .padding(.trailing, width * 0.15)
                                                    .font(.custom("Quicksand", size: 20))
                                                    .foregroundStyle(.white)
                                            }
                                            Spacer()
                                            HStack{
                                                Text("{activity}")
                                                    .padding(.leading, width * 0.15)
                                                    .font(.custom("Quicksand", size: 20))
                                                    .foregroundStyle(.white)
                                                Spacer()
                                                Text("{info}")
                                                    .padding(.trailing, width * 0.15)
                                                    .font(.custom("Quicksand", size: 20))
                                                    .foregroundStyle(.white)
                                            }
                                            Spacer()
                                            HStack{
                                                Text("{activity}")
                                                    .padding(.leading, width * 0.15)
                                                    .font(.custom("Quicksand", size: 20))
                                                    .foregroundStyle(.white)
                                                Spacer()
                                                Text("{info}")
                                                    .padding(.trailing, width * 0.15)
                                                    .font(.custom("Quicksand", size: 20))
                                                    .foregroundStyle(.white)
                                            }
                                            Spacer()
                                            HStack{
                                                Text("{activity}")
                                                    .padding(.leading, width * 0.15)
                                                    .font(.custom("Quicksand", size: 20))
                                                    .foregroundStyle(.white)
                                                Spacer()
                                                Text("{info}")
                                                    .padding(.trailing, width * 0.15)
                                                    .font(.custom("Quicksand", size: 20))
                                                    .foregroundStyle(.white)
                                            }
                                            Spacer()
                                        }
                                    }
                                }
                            }
                            
                        }.padding(.top, width * 0.05)
                            .padding(.bottom, height * 0.05)
                        
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

extension RoundedCornerStyle {
    static let continuousRounded = RoundedCornerStyle.continuous
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}


#Preview {
    UserPage(currentPage: .constant(.user), lastPage: .constant(.user))
}
