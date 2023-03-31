//
//  CharacterListViewViewModel.swift
//  RickyAndMorty
//
//  Created by Onur Sir on 29.03.2023.
//

import UIKit

protocol RMCharacterListViewViewModelDelegate:AnyObject {
    func didLoadInitalCharacters()
}

final class RMCharacterListViewViewModel: NSObject {
    public weak var delegate : RMCharacterListViewViewModelDelegate?
    
    private var cellViewModels : [RMCharacterCollectionViewCellViewModel] = []
    private var characters : [RMCharacter] = [] {
        didSet {
            for character in characters {
                let viewModel = RMCharacterCollectionViewCellViewModel(
                    characterName: character.name ?? "unnamed",
                    characterStatus: character.status,
                    characterImageUrl: URL(string: character.image ?? "google.com")
                )
                cellViewModels.append(viewModel)
            }
        }
        
    }
    
    
   public func fetchCharacters(){
        RMService.shared.execute(.listCharactersRequests, expecting: RMGetAllCharactersResponse.self) { [weak self] result in
            switch result {
            case .success(let responseModel):
                let results = responseModel.results
                self?.characters = results
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitalCharacters()
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}

extension RMCharacterListViewViewModel: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier, for: indexPath) as? RMCharacterCollectionViewCell else {
            fatalError("Unsupported Cell")
        }
//        cell.backgroundColor = .systemGray
        
        let viewModel = cellViewModels[indexPath.row]
        cell.configure(with: viewModel)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30)
        return CGSize(width: width / 2, height: width / 2 * 1.5)
    }

    
    
}
