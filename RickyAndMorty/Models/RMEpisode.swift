//
//  RMEpisode.swift
//  RickyAndMorty
//
//  Created by Onur Sir on 28.03.2023.
//

import Foundation



struct RMEpisode: Codable {
    let id: Int?
    let name, air_date, episode: String?
    let characters: [String]?
    let url: String?
    let created: String?

   
}
