//
//  DemoApp.swift
//  Demo
//
//  Created by Durukan Oktay on 3.12.2023.
//

import SwiftUI

@main
struct DemoApp: App {
    @StateObject private var userAuth = UserAuth()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userAuth)
        }
    }
}
