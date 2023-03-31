//
//  RMCharacterViewController.swift
//  RickyAndMorty
//
//  Created by Onur Sir on 28.03.2023.
//

import UIKit

final class RMCharacterViewController: UIViewController,UINavigationControllerDelegate {

    private let characterListView = RMCharacterListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.delegate = self
        setCustomTitleView(title: "Characters", image: UIImage(named: "rmLogo"))
        setUpView()
        
   }
    
    private func setUpView() {
        view.addSubview(characterListView)
        NSLayoutConstraint.activate([
            characterListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            characterListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            characterListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)])
    }
    private func setupTitle(title: String) {
            let logoView = UIImageView(image: UIImage(named: "rmLogo"))
            logoView.contentMode = .scaleAspectFit
            logoView.frame = CGRect(x: -40, y: 0, width: 70, height: 40)
            
            let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 120, height: 30))
            let titleLabel = UILabel(frame: CGRect(x: 30, y: 0, width: 200, height: 30))
            titleLabel.text = title
            titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            titleView.addSubview(titleLabel)
            titleView.addSubview(logoView)
            logoView.center.y = titleView.center.y
            
            navigationItem.titleView = titleView
        }
    

}
