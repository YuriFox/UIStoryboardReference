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
        let initialViewController = NavigationController.instantiateInitial(from: UIStoryboard.Name.main)
        
        UIApplication.shared.windows.first?.rootViewController = initialViewController
        
    }

}
