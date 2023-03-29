//
//  Extensions.swift
//  RickyAndMorty
//
//  Created by Onur Sir on 29.03.2023.
//

import UIKit

extension UIView {
    // Bu işlev, ana görünüme birden fazla alt görünüm eklemeyi daha temiz ve daha okunabilir bir şekilde yapmanızı sağlar. Önceden, her alt görünümü ayrı ayrı eklemek için addSubview(_:) işlevini her seferinde çağırmanız gerekirdi
    
     func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
         })
     }
    }
