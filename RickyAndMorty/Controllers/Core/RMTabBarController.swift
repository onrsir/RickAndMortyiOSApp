//
//  ViewController.swift
//  RickyAndMorty
//
//  Created by Onur Sir on 28.03.2023.
//

import UIKit

final class RMTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTabs()
        
    }

    private func setUpTabs() {
        
        let characterVC = RMCharacterViewController()
        let locationVC = RMLocationViewController()
        let episodeVC = RMEpisodeViewController()
        let settingsVC = RMSettingsViewController()
        
        let nav1 = UINavigationController(rootViewController: characterVC)
        let nav2 = UINavigationController(rootViewController: locationVC)
        let nav3 = UINavigationController(rootViewController: episodeVC)
        let nav4 = UINavigationController(rootViewController: settingsVC)
        
        nav1.tabBarItem = UITabBarItem(title: "Characters",
                                       image:UIImage(systemName: "person.3"),
                                       tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Locations",
                                       image:UIImage(systemName: "globe.asia.australia.fill"),
                                       tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Episodes",
                                       image:UIImage(systemName: "tv"),
                                       tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "Settings",
                                       image:UIImage(systemName: "gear"),
                                       tag: 4)
    
        setViewControllers(
            [nav1, nav2, nav3, nav4],
            animated: true)
        
    }
}

