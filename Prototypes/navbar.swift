//
//  navbar.swift
//  Demo
//
//  Created by Durukan Oktay on 16.12.2023.
//

import SwiftUI

struct navbar: View {
    var body: some View {
        NavigationView {
            VStack {
                // Sayfa içeriği burada olacak

                Spacer()
                
                // Alt navigasyon barı
                NavigationBarView()
            }
            .navigationBarTitle("Ana Sayfa")
        }
    }
}

struct NavigationBarView: View {
    var body: some View {
        HStack {
            Spacer()
            
            NavigationLink(destination: SecondView()) {
                Image(systemName: "square.grid.2x2")
            }
            .padding(20)
            
            Spacer()
            
            NavigationLink(destination: ThirdView()) {
                Image(systemName: "person.crop.circle")
            }
            .padding(20)
            
            Spacer()
            
            NavigationLink(destination: SettingsView()) {
                Image(systemName: "gearshape")
            }
            .padding(20)
            
            Spacer()
            
            NavigationLink(destination: MessagesView()) {
                Image(systemName: "message")
            }
            .padding(20)
            
            Spacer()
        }
        .background(Color(UIColor.systemBackground))
        .navigationBarHidden(true)
    }
}

struct SecondView: View {
    var body: some View {
        Text("İkinci Sayfa")
            .navigationBarTitle("İkinci Sayfa")
    }
}

struct ThirdView: View {
    var body: some View {
        Text("Üçüncü Sayfa")
            .navigationBarTitle("Üçüncü Sayfa")
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Ayarlar")
            .navigationBarTitle("Ayarlar")
    }
}

struct MessagesView: View {
    var body: some View {
        Text("Mesajlar")
            .navigationBarTitle("Mesajlar")
    }
}

#Preview {
    navbar()
}
