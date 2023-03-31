//
//  Extensions.swift
//  RickyAndMorty
//
//  Created by Onur Sir on 31.03.2023.
//

import Foundation
import UIKit

extension UINavigationControllerDelegate where Self: UIViewController {
    
    func setCustomTitleView(title: String, image: UIImage?) {
        let logoView = UIImageView(image: image)
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

extension UIView {
     func addSubviews(_ views: UIView...) {
         views.forEach({
            addSubview($0)

         })
     }
}
                    
