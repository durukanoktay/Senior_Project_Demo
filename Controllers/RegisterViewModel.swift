//
//  RegisterViewModel.swift
//  Demo
//
//  Created by Durukan Oktay on 20.01.2024.
//

import Foundation

class RegisterViewModel: ObservableObject {
    
    /// A string representing the user's email.
    @Published var email: String = ""
    
    /// A string representing the user's password.
    @Published var password: String = ""
    
    /// A string representing the user's first name.
    @Published var firstName: String = ""
    
    /// A string representing the user's last name.
    @Published var lastName: String = ""
    
    /// A boolean indicating whether the registration process is currently loading.
    @Published var isLoading: Bool = false
    
    /// A string representing an error message that occurred during the registration process.
    @Published var errorMessage: String = ""
    
    /// A boolean indicating whether the user has successfully registered.
    @Published var isRegistered: Bool = false
    
    /// An instance of `AuthApiClient` for making API calls related to authentication.
    private let authApiClient = AuthApiClient()
    
    func register() {
        isLoading = true
        errorMessage = "your password must be consist of at least one special letter and one upper letter"
        authApiClient.register(email: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let token):
                    self?.isRegistered = true
                    print("Registration successful: \(token.accessToken)")
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}

