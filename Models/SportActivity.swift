//
//  SportActivity.swift
//  Demo
//
//  Created by Durukan Oktay on 19.12.2023.
//

import Foundation

enum SportActivity: String, CaseIterable {
    case walking = "Yürüyüş"
    case running = "Koşu"
    case swimming = "Yüzme"
    case fitness = "Fitness"
    case yoga = "Yoga"
    
    var description: String {
        self.rawValue
    }
}
