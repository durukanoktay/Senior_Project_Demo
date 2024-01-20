//
//  LoginViewModel.swift
//  Demo
//
//  Created by Durukan Oktay on 20.01.2024.
//
import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var userAuth: UserAuth
    
    init(userAuth: UserAuth) {
        self.userAuth = userAuth
    }
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    private var authApiClient = AuthApiClient()
    
    func login() {
        authApiClient.login(email: email, password: password, twoFactorCode: "string", twoFactorRecoveryCode: "string") { [weak self] result in
            switch result {
            case .success(let token):
                print("Token: \(token.accessToken)")
                DispatchQueue.main.async {
                    self?.userAuth.updateToken(token, email: self?.email ?? "")
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
