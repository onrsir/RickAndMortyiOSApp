//
//  RMSplashViewModel.swift
//  RickyAndMorty
//
//  Created by Onur Sir on 31.03.2023.
//

import Foundation
import UIKit
import Lottie

final class RMSplashViewModel {

    init() {
        if UserDefaults.standard.object(forKey: "isFirstLaunch") == nil {
            UserDefaults.standard.setValue(true, forKey: "isFirstLaunch")
        }
    }
    
    var welcomeLabelText: String {
        let isFirstLaunch = UserDefaults.standard.bool(forKey: "isFirstLaunch")

        if isFirstLaunch {
            UserDefaults.standard.set(false, forKey: "isFirstLaunch")
            return "Welcome!"
        } else {
            return "Hello!"
        }
    }
    
    func setupAnimation(on view: UIView, aboveSubview subview: UIView) {
        let animationView = LottieAnimationView(name: "animation")
        animationView.frame = view.bounds
        animationView.contentMode = .scaleAspectFit
        view.insertSubview(animationView, belowSubview: subview)
        animationView.loopMode = .loop
        animationView.play()
    }


}
