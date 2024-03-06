//
//  UserAuth.swift
//  Demo
//
//  Created by Durukan Oktay on 20.01.2024.
//





import Foundation
import Combine

class UserAuth: ObservableObject {
    @Published private(set) var token: Token? {
        didSet {
            if let token = token {
                _ = KeychainWrapper().store("accessToken", value: token.accessToken)
                _ = KeychainWrapper().store("refreshToken", value: token.refreshToken)
                _ = KeychainWrapper().store("tokenType", value: token.tokenType)
            } else {
                _ = KeychainWrapper().store("token", value: "")
            }
        }
    }
    
    @Published var id: String?
    
    init() {
        if let storedToken = KeychainWrapper().retrieve("token"), !storedToken.isEmpty {
            token = Token(accessToken:storedToken, refreshToken: "", expiresIn: 3600, tokenType: "")
        }
    }
    
    func updateToken(_ token: Token, email: String) {
        self.token = token
    }

    func clearToken() {
        self.token = nil
    }
    
    func logout() {
        clearToken()
    }
    
    var isAuthenticated: Bool {
        return token != nil
    }
}

