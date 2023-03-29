//
//  RMCharacterCollectionViewCell.swift
//  RickyAndMorty
//
//  Created by Onur Sir on 29.03.2023.
//

import UIKit
import Kingfisher

final class RMCharacterCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "RMCharacterCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    
        override init(frame: CGRect) {
            super.init(frame: frame)
            contentView.backgroundColor = .secondarySystemBackground
            contentView.addSubviews(imageView,nameLabel,statusLabel)
            addConstraints()
        }
        required init?(coder: NSCoder) {
            fatalError("UnSupported")
        }
    private func addConstraints() {
        NSLayoutConstraint.activate([
            statusLabel.heightAnchor.constraint(equalToConstant: 50),
            nameLabel.heightAnchor.constraint (equalToConstant: 50),
            
            statusLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            statusLabel.rightAnchor.constraint (equalTo: contentView.rightAnchor, constant: -5),
            nameLabel.leftAnchor.constraint (equalTo: contentView.leftAnchor, constant: 5),
            nameLabel.rightAnchor.constraint (equalTo: contentView.rightAnchor, constant: -5),
            
            statusLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            nameLabel.bottomAnchor.constraint(equalTo: statusLabel.topAnchor, constant: -3),
            
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -3),

        ])
        nameLabel.backgroundColor = .red
        statusLabel.backgroundColor = .orange
    }
 
                                                  
        override func prepareForReuse() {
            super.prepareForReuse()
            imageView.image = nil
            statusLabel.text = nil
            nameLabel.text = nil
        }
        public func configure(with viewmodel: RMCharacterCollectionViewCellViewModel ){
          
            nameLabel.text = viewmodel.characterName
            statusLabel.text = viewmodel.characterStatusText
            if let url = viewmodel.characterImageUrl {
                        let options: KingfisherOptionsInfo = [.transition(.fade(0.3))]
                        imageView.kf.setImage(with: url, placeholder: nil, options: options)
                    } else {
                        imageView.image = nil
                    }
                
                
            
        }
    }

