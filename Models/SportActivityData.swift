//
//  SportActivityData.swift
//  Demo
//
//  Created by Durukan Oktay on 19.12.2023.
//

import Foundation


struct SportActivityData: Identifiable {
    var id = UUID()
    var activityType: SportActivity
    var duration: String
    var icon: String
}
