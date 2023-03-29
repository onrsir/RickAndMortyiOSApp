//
//  CharacterListViewViewModel.swift
//  RickyAndMorty
//
//  Created by Onur Sir on 29.03.2023.
//

import UIKit

final class RMCharacterListViewViewModel: NSObject {
   public func fetchCharacters(){
        RMService.shared.execute(.listCharactersRequests, expecting: RMGetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension RMCharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier, for: indexPath) as? RMCharacterCollectionViewCell else {
            fatalError("Unsupported Cell")
        }
        cell.backgroundColor = .systemGray
        let myUrl = URL(string: "https://rickandmortyapi.com/api/character/avatar/214.jpeg")
        let viewModel = RMCharacterCollectionViewCellViewModel(characterName: "ONUR", characterStatus: .alive, characterImageUrl: myUrl
        )
        cell.configure(with: viewModel)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30)
        return CGSize(width: width / 2, height: width / 2 * 1.5)
    }

    
    
}
