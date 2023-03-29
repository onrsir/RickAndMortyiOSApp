//
//  RMCharacterCollectionViewCellViewModel.swift
//  RickyAndMorty
//
//  Created by Onur Sir on 29.03.2023.
//

import Foundation
import Kingfisher
import UIKit

final class RMCharacterCollectionViewCellViewModel {
    public let characterName : String
    private let characterStatus : RMCharacterStatus
    public let characterImageUrl: URL?
    
    init(characterName: String, characterStatus: RMCharacterStatus, characterImageUrl: URL?) {
        self.characterName = characterName
        self.characterStatus = characterStatus
        self.characterImageUrl = characterImageUrl
    }
    
    public var characterStatusText: String {
        return characterStatus.rawValue
    }
    
    public func loadImage(into imageView: UIImageView) {
            if let url = characterImageUrl {
                let options: KingfisherOptionsInfo = [.transition(.fade(0.3))]
                imageView.kf.setImage(with: url, placeholder: nil, options: options)
            } else {
                imageView.image = nil
            }
        }
}
