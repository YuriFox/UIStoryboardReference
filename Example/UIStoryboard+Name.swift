//
//  UIStoryboard+Name.swift
//  Example
//
//  Created by Yuri Fox on 2/22/19.
//  Copyright © 2019 Developer Lysytsia. All rights reserved.
//

import UIStoryboardReference

extension UIStoryboard {
    
    /// More convenience initialize because you can use as **UIStoryboard(.main)** instead **UIStoryboard(filename: UIStoryboard.Name.main)**
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
