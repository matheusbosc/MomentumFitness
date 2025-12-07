//  SPDX-License-Identifier: AGPL-3.0-or-later
//
//  AuthView.swift
//  MomentumFitness
//
//  Created by Matheus De Oliveira Boscariol on 2025-11-18.
//

import SwiftUI
import KeychainSwift

struct SettingList: View {
    
    @Binding var currentPage: Page
    @Binding var lastPage: Page
    
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
                    Image(.userPageHeader)
                    Text("settings")
                        .foregroundStyle(.white)
                        .padding(.top, height * 0.075)
                        .padding(.bottom, height * 0.03)
                        .font(.custom("Quicksand", size: 50))
                }
                HStack{
                    Text("account")
                        .foregroundStyle(.white)
                        .padding(.leading, width * 0.1)
                        .font(.custom("Quicksand", size: 38))
                    Spacer()
                }
                HStack{
                    Text("public profile")
                        .foregroundStyle(Color(hex: "1eb0ab"))
                        .padding(.leading, width * 0.1)
                        .font(.custom("Quicksand", size: 24))
                        .onTapGesture {
                            currentPage = .settings_profile
                        }
                    Spacer()
                }
                HStack{
                    Text("preferences")
                        .foregroundStyle(Color(hex: "1eb0ab"))
                        .padding(.leading, width * 0.1)
                        .font(.custom("Quicksand", size: 24))
                        .onTapGesture {
                            currentPage = .settings_prefs
                        }
                    Spacer()
                }
                HStack{
                    Text("account details")
                        .foregroundStyle(Color(hex: "1eb0ab"))
                        .padding(.leading, width * 0.1)
                        .font(.custom("Quicksand", size: 24))
                        .onTapGesture {
                            currentPage = .settings_dets
                        }
                    Spacer()
                }
                HStack{
                    Text("notifications")
                        .foregroundStyle(Color(hex: "1eb0ab"))
                        .padding(.leading, width * 0.1)
                        .font(.custom("Quicksand", size: 24))
                        .onTapGesture {
                            currentPage = .settings_notif
                        }
                    Spacer()
                }
                HStack{
                    Text("privacy & data")
                        .foregroundStyle(Color(hex: "1eb0ab"))
                        .padding(.leading, width * 0.1)
                        .font(.custom("Quicksand", size: 24))
                        .onTapGesture {
                            currentPage = .settings_privacy
                        }
                    Spacer()
                }
                HStack{
                    Text("fitness & community")
                        .foregroundStyle(.white)
                        .padding(.leading, width * 0.1)
                        .padding(.top, height * 0.035)
                        .font(.custom("Quicksand", size: 38))
                    Spacer()
                }
                HStack{
                    Text("community settings")
                        .foregroundStyle(Color(hex: "1eb0ab"))
                        .padding(.leading, width * 0.1)
                        .font(.custom("Quicksand", size: 24))
                        .onTapGesture {
                            currentPage = .settings_comSettings
                        }
                    Spacer()
                }
                HStack{
                    Text("reccomendations")
                        .foregroundStyle(Color(hex: "1eb0ab"))
                        .padding(.leading, width * 0.1)
                        .font(.custom("Quicksand", size: 24))
                        .onTapGesture {
                            currentPage = .settings_recommendations
                        }
                    Spacer()
                }
                HStack{
                    Text("other")
                        .foregroundStyle(.white)
                        .padding(.leading, width * 0.1)
                        .padding(.top, height * 0.035)
                        .font(.custom("Quicksand", size: 38))
                    Spacer()
                }
                HStack{
                    Text("about")
                        .foregroundStyle(Color(hex: "1eb0ab"))
                        .padding(.leading, width * 0.1)
                        .font(.custom("Quicksand", size: 24))
                        .onTapGesture {
                            currentPage = .settings_about
                        }
                    Spacer()
                }
                HStack{
                    Text("help")
                        .foregroundStyle(Color(hex: "1eb0ab"))
                        .padding(.leading, width * 0.1)
                        .font(.custom("Quicksand", size: 24))
                        .onTapGesture {
                            currentPage = .settings_help
                        }
                    Spacer()
                }
                HStack{
                    Text("licenses")
                        .foregroundStyle(Color(hex: "1eb0ab"))
                        .padding(.leading, width * 0.1)
                        .font(.custom("Quicksand", size: 24))
                        .onTapGesture {
                            currentPage = .settings_licenses
                        }
                    Spacer()
                }
                HStack{
                    Text("privacy policy")
                        .foregroundStyle(Color(hex: "1eb0ab"))
                        .padding(.leading, width * 0.1)
                        .font(.custom("Quicksand", size: 24))
                        .onTapGesture {
                            currentPage = .settings_privacypolicy
                        }
                    Spacer()
                }
                HStack{
                    Text("logout")
                        .foregroundStyle(Color(hex: "1eb0ab"))
                        .padding(.leading, width * 0.1)
                        .font(.custom("Quicksand", size: 24))
                        .onTapGesture {
                            currentPage = .settings_logout
                        }
                    Spacer()
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
    SettingList(currentPage: .constant(.user), lastPage: .constant(.settings))
}
