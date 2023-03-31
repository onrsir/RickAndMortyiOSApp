//
//  RMSplashViewController.swift
//  RickyAndMorty
//
//  Created by Onur Sir on 31.03.2023.
//

import UIKit

final class RMSplashViewController: UIViewController, UINavigationControllerDelegate {
    
    private let welcomeLabel = UILabel()
    private let splashViewModel = RMSplashViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self

        configure()
       
    }

    private func configure() {
        
        view.addSubview(welcomeLabel)
        welcomeLabel.text = splashViewModel.welcomeLabelText
        welcomeLabel.textAlignment = .center
        welcomeLabel.font = UIFont.systemFont(ofSize: 40)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100)
        ])
        
        splashViewModel.setupAnimation(on: view, aboveSubview: welcomeLabel)
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
            let rmTabBarVC = RMTabBarController()
            rmTabBarVC.modalPresentationStyle = .fullScreen
            self.present(rmTabBarVC, animated: true, completion: nil)
        }
    }
}



