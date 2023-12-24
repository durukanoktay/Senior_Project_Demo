//
//  LoginViewModel.swift
//  Demo
//
//  Created by Durukan Oktay on 22.12.2023.
//

import Foundation
class LoginViewModel: ObservableObject 
{
    @Published var username: String = ""
    @Published var password: String = ""
}
