//  SPDX-License-Identifier: AGPL-3.0-or-later
//
//  MomentumFitnessApp.swift
//  MomentumFitness
//
//  Created by Matheus De Oliveira Boscariol on 2025-11-16.
//

import SwiftUI
import KeychainSwift

enum Page {
    case home
    case search
    case friends
    case cookbook
    case routines
    case settings
    case user
}

@main
struct MomentumFitnessApp: App {

    @State private var loggedIn = false
    @State private var isMenuOpened = false
    @State private var loading = true
    @State private var currentPage: Page = .home
    @State private var lastPage: Page = .home

    var body: some Scene {
        WindowGroup {
            RootView(loggedIn: $loggedIn, loading: $loading, isMenuOpened: $isMenuOpened, currentPage: $currentPage, lastPage: $lastPage)
                .onAppear {
                    tryAutoLogin()
                }
        }
    }

    func tryAutoLogin() {
        let keychain = KeychainSwift()
        
        guard let access = keychain.get("access_token"),
                  let refresh = keychain.get("refresh_token") else {
                print("Missing tokens — cannot auto login")
                loading = false
                return
            }

        Task {
            do {
                let response = try await check_refresh(access: access, refresh: refresh)
                print(response)

                keychain.set(response.access_token, forKey: "access_token")
                keychain.set(response.refresh_token, forKey: "refresh_token")

                await MainActor.run {
                    loggedIn = true
                    loading = false
                }
            } catch {
                print("Error:", error)
                loading = false
            }
        }
        
//        loading = false
    }

    func check_refresh(access: String, refresh: String) async throws -> RefreshBody {
        let url = URL(string: "https://momentumfitness.matheusbosc.com/api/api/v1/auth/check_refresh_status")!

        let requestBody = RefreshBody(access_token: access, refresh_token: refresh)
        let jsonData = try JSONEncoder().encode(requestBody)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        print(request)
        print(request.httpMethod)
        print(request.httpBody)
        
        let (data, response) = try await URLSession.shared.data(for: request)

        if let http = response as? HTTPURLResponse, !(200...299).contains(http.statusCode) {
            print(http.statusCode)
            throw NSError(domain: "APIError", code: http.statusCode)
        }

        let decoded = try JSONDecoder().decode(RefreshBody.self, from: data)
        return decoded
    }
    
}

struct RootView: View {
    @Binding var loggedIn: Bool
    @Binding var loading: Bool
    @Binding var isMenuOpened: Bool
    @Binding var currentPage: Page
    @Binding var lastPage: Page

    var body: some View {
        
        if (loading){
            LoadingScreen()
        } else {
            if loggedIn {
                ZStack{
                    switch currentPage {
                    case .home:
                        HomeView(loggedIn: $loggedIn, isMenuOpened: $isMenuOpened)
                    case .search:
                        HomeView(loggedIn: $loggedIn, isMenuOpened: $isMenuOpened)
                    case .friends:
                        HomeView(loggedIn: $loggedIn, isMenuOpened: $isMenuOpened)
                    case .cookbook:
                        HomeView(loggedIn: $loggedIn, isMenuOpened: $isMenuOpened)
                    case .routines:
                        HomeView(loggedIn: $loggedIn, isMenuOpened: $isMenuOpened)
                    case .settings:
                        HomeView(loggedIn: $loggedIn, isMenuOpened: $isMenuOpened)
                    case .user:
                        UserPage(currentPage: $currentPage, lastPage: $lastPage)
                    }
                    
                    if (isMenuOpened) {
                        NavigationMenu(isMenuOpened: $isMenuOpened, currentPage: $currentPage)
                    }
                }
            } else {
                AuthView(loggedIn: $loggedIn)
            }
        }
        
    }
}

struct RefreshBody: Codable {
    let access_token: String
    let refresh_token: String
}
