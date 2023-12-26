//
//  Health.swift
//  Demo
//
//  Created by Durukan Oktay on 26.12.2023.
//

import Foundation


enum Health: String, CaseIterable {
    case screen = "Ekran Süresi"
    case steps = "Adım Sayısı"
    case nabiz = "Nabız"
    
    var description: String {
        self.rawValue
    }
}
