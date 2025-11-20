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
    private var server_url: String = "192.168.2.180:2010"
    
    var body: some Scene {

        let access = KeychainService.get("access_token")
        let refresh = KeychainService.get("refresh_token")

        if (access != nil && refresh != nil){
            //let request =

            if (request = ""){
                loggedIn = true
            } 
        }

        WindowGroup {
            if loggedIn {
                            HomeView()
                        } else {
                            AuthView(loggedIn: $loggedIn)
                        }
        }
    }
}
