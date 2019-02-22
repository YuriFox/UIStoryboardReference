//
//  LaunchViewController.swift
//  Example
//
//  Created by Yuri Fox on 2/22/19.
//  Copyright © 2019 Developer Lysytsia. All rights reserved.
//

import UIKit
import UIStoryboardReference

class LaunchViewController: UIViewController {

    @IBAction private func startButtonDidTap(_ sender: UIButton) {
        /// Without explicit type.
        ///
        /// `instantiateInitialViewController` is *UIViewController* type
        ///
        /// *Attention*! If storybard doesn't have initial view controller you throw an exception
        let instantiateInitialViewController = NavigationController.instantiateInitial(from: .main)
        
        /// With explicit type
        ///
        /// `instantiateInitialTypeViewController` is converted to *NavigationController* type
        ///
        /// *Attention*! If storybard doesn't have initial view controller with explicit type you throw an exception
        let instantiateInitialTypeViewController: NavigationController = NavigationController.instantiateInitial(from: .main)
        
        UIApplication.shared.windows.first?.rootViewController = instantiateInitialViewController
        
    }

    func setRootViewControllerWithStoryboardInstance() {
        let storyboard = UIStoryboard(.main)
        
        /// Without explicit type.
        ///
        /// `instantiateInitialViewController` is *UIViewController* type
        ///
        /// *Attention*! If storybard doesn't have initial view controller you throw an exception
        let instantiateInitialViewController = storyboard.initialViewController()
        
        /// With explicit type
        ///
        /// `instantiateInitialTypeViewController` is converted to *NavigationController* type
        ///
        /// *Attention*! If storybard doesn't have initial view controller with explicit type you throw an exception
        let instantiateInitialTypeViewController: NavigationController = storyboard.initialViewController()
        
        UIApplication.shared.windows.first?.rootViewController = instantiateInitialTypeViewController
    }
    
}
