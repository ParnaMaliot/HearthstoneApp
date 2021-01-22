//
//  Categories.swift
//  HeartstoneApp
//
//  Created by Igor Parnadziev on 10/25/20.
//

import Foundation

struct Categories: Decodable {
    var classes: [String] = []
    var sets: [String] = []
    var standard: [String] = []
    var wild: [String] = []
    var types: [String] = []
    var factions: [String] = []
    var qualities: [String] = []
    var races: [String] = []
    //var locales: [String] = []
    
    func getArrayForKey(input: String) -> [String] {
        switch input {
        case "classes":
            return self.classes
        case "sets":
            return self.sets
        case "standard":
            return self.standard
        case "wild":
            return self.wild
        case "types":
            return self.types
        case "factions":
            return self.factions
        case "qualities":
            return qualities
        case "races":
            return races
//        case "locales":
//            return locales
        default: return []
        }
    }
}
