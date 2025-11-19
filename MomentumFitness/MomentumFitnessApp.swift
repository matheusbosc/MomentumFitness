/*

    Momentum Fitness 
    Copyright (C) 2025  Matheus De Oliveira Boscariol

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.

*/

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
