//
//  LoginView.swift
//  Demo
//
//  Created by Durukan Oktay on 22.12.2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginViewModel: LoginViewModel
    
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
                    TextField("E-posta adresiniz", text: $loginViewModel.username)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                    
                    Text("Şifre")
                        .font(.headline)
                    SecureField("Şifreniz", text: $loginViewModel.password)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                    
                    
                }
                .padding()
            }
        }
    }
}

#Preview {

    LoginView(loginViewModel: <#LoginViewModel#>)
}
