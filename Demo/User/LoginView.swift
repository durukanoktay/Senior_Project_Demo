//
//  LoginView.swift
//  Demo
//
//  Created by Durukan Oktay on 22.12.2023.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Giriş Yap")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                VStack(alignment: .leading) {
                    Text("E-posta")
                        .font(.headline)
                    TextField("E-posta adresiniz", text: $username)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                    
                    Text("Şifre")
                        .font(.headline)
                    SecureField("Şifreniz", text: $password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                    
                    
                }
                .padding()
                NavigationLink(destination: RegisterView()) {
                    Text("Hesabınız yok mu? Kayıt Ol")
                        .foregroundColor(.blue)
                }
                .padding(.top, 15)
            }
        }
    }
}

#Preview {
    LoginView()
}
