//
//  Token.swift
//  Demo
//
//  Created by Durukan Oktay on 20.01.2024.
//
import Foundation

struct Token: Codable {
    var tokenType: String
    var accessToken: String
    var expiresIn: Int
    var refreshToken: String

    private enum CodingKeys: CodingKey {
        case tokenType, accessToken, expiresIn, refreshToken
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.tokenType = try container.decode(String.self, forKey: .tokenType)
        self.accessToken = try container.decode(String.self, forKey: .accessToken)
        self.expiresIn = try container.decode(Int.self, forKey: .expiresIn)
        self.refreshToken = try container.decode(String.self, forKey: .refreshToken)
       
    }

    init(accessToken: String, refreshToken: String, expiresIn: Int, tokenType: String) {
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        self.expiresIn = expiresIn
        self.tokenType = tokenType
    }
}
