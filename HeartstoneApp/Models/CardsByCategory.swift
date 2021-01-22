//
//  CardsByCategory.swift
//  HeartstoneApp
//
//  Created by Igor Parnadziev on 10/23/20.
//

import Foundation

struct CardsByCategory: Decodable {
    var classes: [String]
    var sets: [String]
    var standard: [String]
    var wild: [String]
    var types: [String]
    var factions: [String]
    var qualities: [String]
    var races: [String]
    //var locales: [String]
}
