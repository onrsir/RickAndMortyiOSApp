//
//  RMCharacter.swift
//  RickyAndMorty
//
//  Created by Onur Sir on 28.03.2023.
//

import Foundation

// MARK: - RMCharacterElement
struct RMCharacter: Codable {
    let id: Int?
    let name,species, type: String?
    let status : RMCharacterStatus
    let gender: String?
    let origin, location: Location
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

// MARK: - Location
struct Location: Codable {
    let name: String?
    let url: String?
}

enum RMCharacterStatus : String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

enum RMCharacterGender : String, Codable {
    case female = "Female"
    case male = "Male"
    case genderless = "Genderless"
    case unknown = "unknown"
}


