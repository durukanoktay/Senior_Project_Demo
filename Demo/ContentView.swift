//
//  ContentView.swift
//  Demo
//
//  Created by Durukan Oktay on 3.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView()
        {
            Friends().tabItem
            {
                Image(systemName: "bubble")
                Text("messages")
            }
            Explore().tabItem
            { Image(systemName: "person.3.sequence")
                Text("Explore")
            }
            Home().tabItem
            {
                Image (systemName: "house")
                Text("Home")
            }
            Profile().tabItem
            {
                Image(systemName: "person")
                Text("profile")
            }
            
         
        }
         
        
    }
}

#Preview {
    ContentView()

}
