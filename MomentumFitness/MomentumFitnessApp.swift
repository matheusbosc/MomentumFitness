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
        WindowGroup {
            RootView(loggedIn: $loggedIn)
                .onAppear {
                    tryAutoLogin()
                }
        }
    }

    func tryAutoLogin() {
        guard let access = KeychainService.get("access_token"),
              let refresh = KeychainService.get("refresh_token") else {
            return
        }

        Task {
            do {
                let response = try await check_refresh(access: access, refresh: refresh)

                KeychainService.set("access_token", for: response.access_token)
                KeychainService.set("refresh_token", for: response.refresh_token)

                print(KeychainService.set("access_token"))
                print(KeychainService.set("refresh_token"))

                await MainActor.run {
                    loggedIn = true
                }
            } catch {
                print("Error:", error)
            }
        }
    }

    func check_refresh(access: String, refresh: String) async throws -> RefreshBody {
        let url = URL(string: "https://momentumfitness.matheusbosc.com/api/v1/auth/check_refresh_status")!

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

        let decoded = try JSONDecoder().decode(RefreshBody.self, from: data)
        return decoded
    }
}

struct RootView: View {
    @Binding var loggedIn: Bool

    var body: some View {
        if loggedIn {
            HomeView(loggedIn: $loggedIn)
        } else {
            AuthView(loggedIn: $loggedIn)
        }
    }
}

struct RefreshBody: Codable {
    let access_token: String
    let refresh_token: String
}
