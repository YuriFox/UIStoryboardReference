# UIStoryboardReference

[![platform](https://img.shields.io/badge/Platform-iOS%208%2B-blue.svg)]()
[![language](https://img.shields.io/badge/Language-Swift%204.2-red.svg)]()
[![language](https://img.shields.io/badge/pod-4.0.0-blue.svg)]()
[![license](https://img.shields.io/badge/license-MIT-lightgray.svg)]()

- [Installation](#-installation)
    - [CocoaPods](#using-cocoapods)    
- [Usage](#-usage)
    - [Integrate](#integrate)
    - [Storyboard](#storyboard-instance)
    - [ViewController](#instantiate-view-controller)
- [Next steps](#-next-steps)
- [License](#-license)

## 📲 Installation
### Using [CocoaPods](https://cocoapods.org)
To integrate `UIStoryboardReference` into your Xcode project you need edit your `Podfile` and specify the dependency:
```ruby
pod 'UIStoryboardReference'
```

## 💻 Usage
### Integrate
**0.** You can simply copy the code from the [**Example**](UIStoryboard+Name.swift) and change cases inside the `UIStoryboard.Name` enum **OR** try to do it yourself and start from next step.

**1.** Create `.swift` file in your project. You can name it whatever you like. For example: `UIStoryboard+Name.swift`

**2.** Import `UIStoryboardReference` in proper place and make `extension` for `UIStoryboard` with `enum` which implements `UIStoryboardFilename`.
```swift
import UIStoryboardReference

extension UIStoryboard {

    /// More convenience initialize:
    ///
    ///      // Because you can use this:
    ///      let storyboard = UIStoryboard(.main)
    ///      // instead this:
    ///      let storyboard = UIStoryboard(filename: UIStoryboard.Name.main)
    convenience init(_ name: Name) {
        self.init(filename: name)
    }

    /// Name for easy and safe reference to storyboard
    enum Name: String, UIStoryboardFilename {

        /// Name of **Launch.storybard**
        case launch

        /// Name of **Main.storybard**
        case main

        var storyboardFilename: String {
            return self.rawValue.capitalized
        }

    }  

}
```

**3.** Add `init` into `UIStoryboard` extension. **(Not necessary)**
```swift
extension UIStoryboard {

    /// More convenience initialize:
    ///
    ///      // Because you can use this:
    ///      let storyboard = UIStoryboard(.main)
    ///      // instead this:
    ///      let storyboard = UIStoryboard(filename: UIStoryboard.Name.main)
    convenience init(_ name: Name) {
        self.init(filename: name)
    }

}
```

**4.** Also you can make `extension` for `UIViewController`. **(Not necessary)**
```swift
extension UIViewController {

    /// It's the same for more convenience initialize:
    ///
    ///      // Because you can use this:
    ///      let storyboard = UIViewController.instantiate(from: .main)
    ///      // instead this:
    ///      let storyboard = UIViewController.instantiate(from: UIStoryboard.Name.main)

    static func instantiateInitial(from name: UIStoryboard.Name) -> Self {
        let storyboard = UIStoryboard(filename: name)
        return storyboard.initialViewController()
    }

    static func instantiate(from name: UIStoryboard.Name) -> Self {
        let storyboard = UIStoryboard(filename: name)
        return storyboard.viewController()
    }

}

```

### Storyboard Instance
```swift
let mainStoryboard = UIStoryboard(.main)
let launchStoryboard = UIStoryboard(.launch)
```

### Instantiate Initial View Controller
**1.** With `UIStoryboard` instance
```swift
let storyboard = UIStoryboard(.main)

/// Without explicit type.
///
/// `instantiateInitialViewController` is *UIViewController* type
///
/// *Attention*! If storybard doesn't have initial view controller you throw an exception
let instantiateInitialViewController = storyboard.initialViewController()

/// With explicit type
///
/// `instantiateInitialTypeViewController` is casting to *NavigationController* type
///
/// *Attention*! If storybard doesn't have initial view controller with explicit type you throw an exception
let instantiateInitialTypeViewController: NavigationController = storyboard.initialViewController()
```

**2.** With View Controller.
```swift
let instantiateInitialViewController = NavigationController.instantiateInitial(from: .main)

let instantiateInitialTypeViewController: NavigationController = NavigationController.instantiateInitial(from: .main)
```

### Instantiate View Controller
**0.** Set `UIViewController` _custom class_ and _storyboard ID_
![](example_img_0.png)

**1.** With `UIStoryboard` instance
```swift
let storyboard = UIStoryboard(.main)

/// Storyboard `instantiateViewController` with identefier which describe view controller type. If this case `RedViewController`
///
/// `instantiateViewController` is *UIViewController* type
///
/// *Attention*! If storybard doesn't have initial view controller you throw an exception
let instantiateViewController: RedViewController = storyboard.viewController()
```
**2.** With View Controller
```swift
let instantiateViewController = RedViewController.instantiate(from:.main)
```

## 📋 Next steps
- [x] Documentation
- [ ] Storyboard cache

## 👮🏻 License
Released under the MIT license. See [LICENSE](LICENSE) for details.
