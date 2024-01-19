//
//  RegisterView.swift
//  Demo
//
//  Created by Durukan Oktay on 26.12.2023.
//

import SwiftUI

struct RegisterView: View {
    
    @State var name: String = ""
    @State var surname: String = ""
    @State var password: String = ""
    @State var controlpassword = ""
    @State var email: String = ""
    @State var userAgreement = false
    @State var healthAgreement = false
    @State private var redirectToLoginView = false
    @State private var showAlert = false
    
    func checkPassword()
    {
        if(password != controlpassword)     
        {
            print("Uyarı: Şifreler eşleşmiyor!")
            showAlert = true
        }
    }
    
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
                    
                    
                    Toggle(isOn: $healthAgreement) {
                        Text("Health Agreement")
                            .onTapGesture {
                                healthAgreement.toggle()
                                          }
                                                    }
                    
                    Toggle(isOn: $userAgreement) {
                        Text("User Agreement")
                            .onTapGesture {
                                userAgreement.toggle()
                                          }
                                                 }
                    
                                   NavigationLink(destination: LoginView(), isActive: $redirectToLoginView)
                                   {
                                       Button("Kayıt Ol!") {
                                           redirectToLoginView = true
                                       }.font(.headline)
                                           .foregroundColor(.white)
                                           .padding()
                                           .frame(maxWidth: .infinity)
                                           .background(Color.blue)
                                           .cornerRadius(10)
                                   }
                    
                    
                    NavigationLink(destination: LoginView(), isActive: $redirectToLoginView)
                    {
                        Button("Giriş yap") {
                            redirectToLoginView = true
                        }.font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                    
                }
                .padding()
                // şifre eşleştirmesi için kontrol
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Uyarı"), message: Text("Şifreler eşleşmiyor!"), dismissButton: .default(Text("Tamam")))
                }
                

            }
        }
    }
    }

#Preview {
    RegisterView()
}
