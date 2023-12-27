//
//  RegisterViewModel.swift
//  Demo
//
//  Created by Durukan Oktay on 22.12.2023.
//

import Foundation

class RegisterViewModel: ObservableObject
{
    @Published  var name: String = ""
    @Published  var surname: String = ""
    @Published  var password: String = ""
    @Published  var email: String = ""
    @Published var userAgreement = false
    @Published var healthAgreement = false
}

