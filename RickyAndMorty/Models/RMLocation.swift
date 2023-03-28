//
//  RMLocation.swift
//  RickyAndMorty
//
//  Created by Onur Sir on 28.03.2023.
//

import Foundation

    
    // MARK: - RMLocation
    struct RMLocation: Codable {
        let id: Int?
        let name, type, dimension: String?
        let residents: [String]?
        let url: String?
        let created: String?
    }
  

