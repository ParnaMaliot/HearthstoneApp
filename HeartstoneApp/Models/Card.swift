//
//  Card.swift
//  HeartstoneApp
//
//  Created by Igor Parnadziev on 10/21/20.
//

import Foundation

struct Card: Codable {
    var cardId: String?
    var name: String?
    var cardSet: String?
    var type: String?
    var cardText: String?
    var playerClass: String?
    var image: String?
    var imgFix: String?
    
    private enum CodingKeys: String, CodingKey {
        case cardId
        case name
        case cardSet
        case type
        case cardText = "text"
        case playerClass
        case image = "img"
    }
}
