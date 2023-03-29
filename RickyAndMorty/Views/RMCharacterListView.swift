//
//  CharacterListView.swift
//  RickyAndMorty
//
//  Created by Onur Sir on 29.03.2023.
//

import UIKit

final class RMCharacterListView: UIView {

    
    private let viewModel = RMCharacterListViewViewModel()
    
    private let spinner : UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let collectionView: UICollectionView = {
        // Collection view düzenini (layout) oluşturun
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        // UICollectionView nesnesini oluşturun ve yapılandırın
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.alpha = 0
        // Hücreleri ve ek bileşenleri kaydedin (register)
        collectionView.register(RMCharacterCollectionViewCell.self, forCellWithReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier)

        return collectionView
    }()

    
    
    //MARK: - İNİT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBackground
        addSubviews(collectionView, spinner)
        
        addConstraints()
        spinner.startAnimating()
        viewModel.fetchCharacters()
        setUpCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            // Spinner için kısıtlamalar
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),

            // CollectionView için kısıtlamalar
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    private func setUpCollectionView() {
        
        collectionView.dataSource = viewModel
        collectionView.delegate = viewModel
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            self.spinner.stopAnimating()
            UIView.animate(withDuration: 0.4) {
                self.collectionView.alpha = 1
            }
            
            
        })
        
    }

    
}
