//
//  Cards.swift
//  HeartstoneApp
//
//  Created by Igor Parnadziev on 10/21/20.
//

import Foundation

struct Cards: Decodable {
    var basic: [Card]
    
    private enum CodingKeys: String, CodingKey {
        case basic = "Basic"
    }
}
