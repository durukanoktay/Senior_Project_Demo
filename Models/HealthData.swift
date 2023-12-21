//
//  HealthData.swift
//  Demo
//
//  Created by Durukan Oktay on 19.12.2023.
//

import Foundation

struct HealthData: Identifiable {
    var id = UUID()
    var dataType: String
    var value: String
    var symbolName: String
}
