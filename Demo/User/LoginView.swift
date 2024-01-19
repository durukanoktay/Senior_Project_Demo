//
//  LoginView.swift
//  Demo
//
//  Created by Durukan Oktay on 22.12.2023.
//

import SwiftUI

struct LoginView: View {
 
    @State var username: String = ""
    @State var password: String = ""
    @State private var redirectToHome = false
    @State private var redirectToRegisterView = false
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
                    
                    NavigationLink(destination: Home(), isActive: $redirectToHome)
                    {
                        Button("Giriş Yap") {
                            redirectToHome = true
                        }.font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: RegisterView(), isActive: $redirectToRegisterView)
                    {
                        Button("Kayıt Ol") {
                            redirectToHome = true
                        }.font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                }
                .padding()

            }
        }
    }
}

#Preview {
LoginView()
}
