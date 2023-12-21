//
//  Messages.swift
//  Demo
//
//  Created by Durukan Oktay on 21.12.2023.
//

import Foundation

struct Message: Identifiable {
    var id = UUID()
    var senderName: String
    var content: String
    var seen: Bool
}
