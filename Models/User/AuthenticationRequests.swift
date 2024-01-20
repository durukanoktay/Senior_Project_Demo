//
//  AuthenticationRequests.swift
//  Demo
//
//  Created by Durukan Oktay on 20.01.2024.
//

import Foundation

struct LoginRequest: Codable {
    var email: String
    var password: String
    var twoFactorCode: String
    var twoFactorRecoveryCode: String
}

struct RegisterRequest: Codable {
    var email: String
    var password: String
}

