//
//  RegisterView.swift
//  Demo
//
//  Created by Durukan Oktay on 22.12.2023.
//

import SwiftUI

struct RegisterView: View {
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var surname: String = ""
    @State private var email: String = ""
    var body: some View {
        NavigationView {
            VStack {
                Text("Hesap Oluştur")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading) {
                    Text("Ad")
                        .font(.headline)
                    TextField("Adınız", text: $name)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                    
                    Text("Soyad")
                        .font(.headline)
                    TextField("Soyadınız", text: $surname)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                    
                    Text("E-posta")
                        .font(.headline)
                    TextField("E-posta adresiniz", text: $email)
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
            }
        }
    }
}




#Preview {
    RegisterView()
}
