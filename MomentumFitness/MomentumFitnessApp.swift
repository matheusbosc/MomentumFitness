//  SPDX-License-Identifier: AGPL-3.0-or-later
//
//  MomentumFitnessApp.swift
//  MomentumFitness
//
//  Created by Matheus De Oliveira Boscariol on 2025-11-16.
//

import SwiftUI

@main
struct MomentumFitnessApp: App {
    
    @State private var loggedIn = false
    
    var body: some Scene {

        let access = KeychainService.get("access_token")
        let refresh = KeychainService.get("refresh_token")

        if (access != nil && refresh != nil){   
            
            let response = check_refresh(access: access, refresh: refresh)

            KeychainService.set("access_token", response.access_token)
            KeychainService.set("refresh_token", response.refresh_token)
            
            loggedIn = true
        }

        WindowGroup {
            if loggedIn {
                            HomeView()
                        } else {
                            AuthView(loggedIn: $loggedIn)
                        }
        }
    }

    func check_refresh(access: String, refresh: String) async throws -> RefreshBody {
        guard let url = URL(string: "https://special-train-grp7jx4w9q439w7w-8000.app.github.dev/api/v1/auth/check_refresh_status") else {
                return 
            }

        let requestBody = RefreshBody(access_token: access, refresh_token: refresh)
        let jsonData = try JSONEncoder().encode(requestBody)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let (data, response) = try await URLSession.shared.data(for: request)

        if let http = response as? HTTPURLResponse, !(200...299).contains(http.statusCode) {
            throw NSError(domain: "APIError", code: http.statusCode)
        }

        let decoded = try JSONDecoder().decode(LoginResponse.self, from: data)
        return decoded
    }
}

struct RefreshBody: Codable {
    let access_token: String
    let refresh_token: String
}