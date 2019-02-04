//
//  StoryboardReference.swift
//  UIStoryboardReference
//
//  Created by Yuri Fox on 2/4/19.
//  Copyright © 2019 Developer Lysytsia. All rights reserved.
//

import class UIKit.UIViewController

public protocol UIStoryboardReference: class {
    
    /// Unique storyboard identefier
    static var storyboardReferenceIdentefier: String { get }
    
}

extension UIViewController: UIStoryboardReference {

    public static var storyboardReferenceIdentefier: String {
        return String(describing: self)
    }

}

