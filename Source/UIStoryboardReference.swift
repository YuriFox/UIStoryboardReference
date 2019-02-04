//
//  UIStoryboardReference.swift
//  UIStoryboardReference
//
//  Created by Yuri Fox on 2/4/19.
//  Copyright © 2019 Developer Lysytsia. All rights reserved.
//

import class UIKit.UIViewController
import class UIKit.UIStoryboard
import class Foundation.Bundle

public protocol UIStoryboardReference: class {
    
    /// Unique storyboard identefier
    static var storyboardReferenceIdentefier: String { get }
    
}

extension UIStoryboard {

    /// Creates and returns a storyboard object for the specified storyboard resource file name.
    ///
    /// - Parameters:
    ///   - filename: The filename of the storyboard resource.
    ///   - bundle: The bundle containing the storyboard file and its related resources. If you specify nil, this method looks in the main bundle of the current application.
    public convenience init(_ filename: Filename, bundle: Bundle? = nil) {
        self.init(name: filename, bundle: bundle)
    }

    /// Instantiates and returns the initial view controller in the view controller graph
    ///
    /// - Parameter controllerType: The initial view controller
    public func initialViewController<T: UIViewController>(_ controllerType: T.Type) -> T {

        guard let controller = self.instantiateInitialViewController() as? T else {
            fatalError("Couldn't instantiate initial view controller with identifier")
        }

        return controller

    }

    /// Instantiates and returns the initial view controller in the view controller graph
    ///
    /// - Parameter controllerType: The initial view controller
    public func initialViewController<T: UIViewController>() -> T {
        return self.initialViewController(T.self)
    }
    
    /// Instantiates and returns the view controller with the specified storyboard reference identefier.
    ///
    /// - Returns: The view controller corresponding to the specified storyboard reference identifier string. If no view controller is associated with the string, this method throws an exception.
    public func viewController<T: UIViewController>(_ controllerType: T.Type) -> T {

        guard let controller = self.instantiateViewController(withIdentifier: controllerType.storyboardReferenceIdentefier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardReferenceIdentefier)")
        }

        return controller

    }

    /// Instantiates and returns the view controller with the specified storyboard reference identefier.
    ///
    /// - Returns: The view controller corresponding to the specified storyboard reference identifier string. If no view controller is associated with the string, this method throws an exception.
    public func viewController<T: UIViewController>() -> T {
        return self.viewController(T.self)
    }
    
    /// The safe name of the storyboard resource. Storyboard filename without `.storyboard`.
    public typealias Filename = String

}

extension UIViewController: UIStoryboardReference {
    
    public static var storyboardReferenceIdentefier: String {
        return String(describing: self)
    }
    
}
