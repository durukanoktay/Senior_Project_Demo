//
//  ApiEndpoints.swift
//  Demo
//
//  Created by Durukan Oktay on 13.01.2024.
//

import Foundation
struct ApiEndpoints
{
    static let BASE_URL: String = "http://localhost:5086"
    static let REGISTER: String = "/auth/register" // endpointleri eklediğimiz kısım
    static let LOGIN: String = "/auth/login"
    
    
    func getRegisterUrl() -> String
    {
        return ApiEndpoints.BASE_URL + ApiEndpoints.REGISTER
    }
    func getLoginUrl() -> String
    {
        return ApiEndpoints.BASE_URL + ApiEndpoints.LOGIN
    }
}
