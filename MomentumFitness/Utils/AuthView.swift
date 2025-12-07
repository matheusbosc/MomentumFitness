//  SPDX-License-Identifier: AGPL-3.0-or-later
//
//  AuthView.swift
//  MomentumFitness
//
//  Created by Matheus De Oliveira Boscariol on 2025-11-18.
//

import SwiftUI
import KeychainSwift

struct AuthView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    @Binding var loggedIn: Bool
    
    //@FocusState private var emailFieldIsFocused: Bool = false
    let mainGradient = LinearGradient(colors: [
        Color(red: 0.22, green: 0.51, blue: 0.843),
        Color(red: 0.059, green: 0.8, blue: 0.565)],
                                      startPoint: .leading,
                                      endPoint: .trailing)
    
    var body: some View {
        
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        
                
                VStack{
                    ZStack{
                        Image(.authPageBG)
                        VStack{
                            Text("momentum")
                                .font(.custom("Quicksand", size: 64))
                                .foregroundStyle(mainGradient)
                            Text("fitness")
                                .font(.custom("Quicksand", size: 40))
                                .foregroundStyle(.white)
                        }
                    }
                    Spacer()
                    
                    TextField(
                        "",
                        text: $username,
                        prompt: Text("username").font(.custom("Quicksand", size: 24)).foregroundStyle(Color(hex: "384765"))
                    )
                    .onSubmit {
                        
                    }
                    .padding()
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .foregroundStyle(.white)
                    .frame(maxWidth: width * 0.88, maxHeight: height * 0.0568)
                    .background(
                        RoundedRectangle(cornerRadius: 36)
                            .fill(Color(hex: "172031"))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 36)
                            .stroke(Color(hex: "1F293C"), lineWidth: 3)
                    )
                    .shadow(radius: 4)
                    .padding(.vertical, 7)
                    .font(.custom("Quicksand", size: 24))
                    
                    SecureField(
                        "",
                        text: $password,
                        prompt: Text("password").font(.custom("Quicksand", size: 24)).foregroundStyle(Color(hex: "384765"))
                    )
                    .onSubmit {
                        
                    }
                    .padding()
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .foregroundStyle(.white)
                    .frame(maxWidth: width * 0.88, maxHeight: height * 0.0568)
                    .background(
                        RoundedRectangle(cornerRadius: 36)
                            .fill(Color(hex: "172031"))
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 36)
                            .stroke(Color(hex: "1F293C"), lineWidth: 3)
                    )
                    .shadow(radius: 4)
                    .padding(.vertical, 7)
                    .font(.custom("Quicksand", size: 24))
                    
                    Button {
                        
                        print(username)
                        print(password)
                        
                        Task {
                            do {
                                
                                let response = try await login(user: username, password: password)

                                print("Access:", response.access_token)
                                print("Refresh:", response.refresh_token)

                                let keychain = KeychainSwift()
                                keychain.set(response.access_token, forKey: "access_token")
                                keychain.set(response.refresh_token, forKey: "refresh_token")
                                keychain.set(username, forKey: "username")
                                
                                loggedIn = true
                                
                            } catch {
                                print("Error:", error)
                            }
                        }
                    } label: {
                        ZStack{
                            
                            RoundedRectangle(cornerRadius: 36)
                                .fill(mainGradient)
                            Text("login")
                                .font(.custom("Quicksand", size: 24))
                                .foregroundStyle(.white)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 12)
                        }
                        .frame(maxWidth: width * 0.5, maxHeight: height * 0.05)
                    }
                    .buttonStyle(.plain)
                    .padding(20)
                    .shadow(color: Color(hex: "3782D6"), radius: 5)
                    
                    Button {
                        
                    }label: {
                        Text("no account?").foregroundStyle(Color(hex: "384765")).font(.custom("Quicksand", size: 18))
                        Text("register").foregroundStyle(mainGradient).font(.custom("Quicksand", size: 18))
                    }
                    .buttonStyle(.plain)
                    
                    Spacer()
                    
                    
                
            
            
                }.keyboardAdaptive()
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(colors: [
                    Color(red: 0.059, green: 0.055, blue: 0.102),
                    Color(red: 0.039, green: 0.082, blue: 0.125)],
                                           startPoint: .topLeading,
                                           endPoint: .bottomTrailing))
    }
    
    func login(user: String, password: String) async throws -> RefreshBody {
        let url = URL(string: "https://momentumfitness.matheusbosc.com/api/api/v1/auth/login?email=\(urlEncode(user))&password=\(urlEncode(password))")!

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let (data, response) = try await URLSession.shared.data(for: request)

        if let http = response as? HTTPURLResponse, !(200...299).contains(http.statusCode) {
            throw NSError(domain: "APIError", code: http.statusCode)
        }

        let decoded = try JSONDecoder().decode(RefreshBody.self, from: data)
        return decoded
    }
    
    func urlEncode(_ text: String) -> String {
        let allowed = CharacterSet.urlQueryAllowed
        return text.addingPercentEncoding(withAllowedCharacters: allowed) ?? text
    }

}
struct LoginBody: Codable {
    let user: String
    let password: String
}


#Preview {
    AuthView(loggedIn: .constant(false))
}
