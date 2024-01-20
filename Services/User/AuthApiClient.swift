//
//  AuthApiFile.swift
//  Demo
//
//  Created by Durukan Oktay on 20.01.2024.
//
import Foundation

/// The AuthApiClient class handles the API calls related to authentication.
///
/// It inherits from the BaseApiClient class and provides methods for logging in and registering users.
class AuthApiClient: BaseApiClient {

    func login(
        email: String,
        password: String,
        twoFactorCode: String,
        twoFactorRecoveryCode: String,
        completion: @escaping (Result<Token, Error>) -> Void) {
        let loginRequest = LoginRequest(email: email, password: password, twoFactorCode: "string", twoFactorRecoveryCode: "string")
        guard let url = URL(string: ApiEndpoints().getLoginUrl()) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(loginRequest)

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let token = try JSONDecoder().decode(Token.self, from: data)
                    completion(.success(token))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
        func register(
            email: String,
            password: String,
            completion: @escaping (Result<Token, Error>) -> Void) {
            let registerRequest = RegisterRequest(email: email, password: password)
            guard let url = URL(string: ApiEndpoints().getRegisterUrl()) else { return }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try? JSONEncoder().encode(registerRequest)

            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                } else if let data = data {
                    do {
                        let token = try JSONDecoder().decode(Token.self, from: data)
                        completion(.success(token))
                    } catch {
                        completion(.failure(error))
                    }
                }
            }
            task.resume()
        }
    }
