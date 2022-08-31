//
//  Country.swift
//  Challenge5
//
//  Created by Melody Davis on 8/30/22.
//

import Foundation

struct Country: Codable {
    let name: String
    let capital: String
    let officialLanguages: Array<String>
    let landArea: String
    let waterPercentage: Double
    let population: String
    let currency: Array<String>
    let drivingSide: String
    let callingCode: Array<String>
    let unCode: String
}
