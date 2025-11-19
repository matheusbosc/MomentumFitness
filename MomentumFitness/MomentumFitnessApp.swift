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
            if loggedIn {
                            HomeView()
                        } else {
                            AuthView(loggedIn: $loggedIn)
                        }
        }
    }
}
