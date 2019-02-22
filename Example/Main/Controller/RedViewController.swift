//
//  RedViewController.swift
//  Example
//
//  Created by Yuri Fox on 2/22/19.
//  Copyright © 2019 Developer Lysytsia. All rights reserved.
//

import UIKit
import UIStoryboardReference

class RedViewController: UIViewController {

    @IBAction private func redButtonDidTap(_ sender: UIButton) {
        self.showViewController(type: RedViewController.self)
    }

    @IBAction private func orangeButtonDidTap(_ sender: UIButton) {
        self.showViewController(type: OrangeViewController.self)
    }
    
    @IBAction private func greenButtonDidTap(_ sender: UIButton) {
        self.showViewController(type: GreenViewController.self)
    }
    
    private func showViewController(type: UIViewController.Type) {
        let controller = type.instantiate(from: UIStoryboard.Name.main)
        self.show(controller, sender: nil)
    }
    
}
