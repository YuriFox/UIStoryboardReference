//
//  UIStoryboard+Name.swift
//  Example
//
//  Created by Yuri Fox on 2/22/19.
//  Copyright © 2019 Developer Lysytsia. All rights reserved.
//

import UIStoryboardReference

// Why do you need this file?

// 1. You won't need to add import in every file where used because you need import UIStoryboardReference only in one place

// 2. Following usage will be more convenience because:
//    For UIStoryboard
//    You can use this: UIStoryboard(.main)
//    Instead this UIStoryboard(filename: UIStoryboard.Name.main)
//
//    For UIViewController
//    You can use this: UIViewController.instantiate(.main)
//    Instead this UIViewController.instantiate(UIStoryboard.Name.main)

extension UIStoryboard {
    
    convenience init(_ name: Name) {
        self.init(filename: name)
    }
    
    /// Name for easy and safe reference to storyboard
    enum Name: String, UIStoryboardFilename {
        
        /// Launch.storybard
        case launch
        
        /// Main.storybard
        case main
        
        var storyboardFilename: String {
            return self.rawValue.capitalized
        }
        
    }
    
}

extension UIViewController {
    
    static func instantiateInitial(from name: UIStoryboard.Name) -> Self {
        let storyboard = UIStoryboard(filename: name)
        return storyboard.initialViewController()
    }
    
    static func instantiate(from name: UIStoryboard.Name) -> Self {
        let storyboard = UIStoryboard(filename: name)
        return storyboard.viewController()
    }
    
}
