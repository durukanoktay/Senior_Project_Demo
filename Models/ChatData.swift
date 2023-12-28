//
//  ChatData.swift
//  Demo
//
//  Created by Durukan Oktay on 27.12.2023.
//

import Foundation



struct ChatData: Identifiable, Decodable {
    var id = UUID()
    var content: String
    var sender: Bool //if sender is self True if sender is not False
//  var date: Date  //Will be added after API
}
