//
//  RMLocationViewController.swift
//  RickyAndMorty
//
//  Created by Onur Sir on 28.03.2023.
//

import UIKit

final class RMLocationViewController: UIViewController,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationController?.delegate = self
        setCustomTitleView(title: "Locations", image: UIImage(named: "rmLogo"))
       
        
    }
   
    

  

}
