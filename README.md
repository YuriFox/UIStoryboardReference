# UIStoryboardReference

[![platform](https://img.shields.io/badge/Platform-iOS%208%2B-blue.svg)]()
[![language](https://img.shields.io/badge/Language-Swift-red.svg)]()
[![language](https://img.shields.io/badge/pod-4.0.0-blue.svg)]()
[![license](https://img.shields.io/badge/license-MIT-lightgray.svg)]()

- [Requirements](#requirements)

- [Installation](#installation)
    - [CocoaPods](#CocoaPods)
    
- [Usage](#usage)
    - [Storyboard](#Storyboard)
    - [ViewController](#ViewController)
    
- [License](#license)

## Requirements

- iOS 8.0+
- Xcode 9.0+
- Swift 4.0+

## Installation
### Cocoa pods
To integrate `UIStoryboardReference` into your Xcode project using [CocoaPods](http://cocoapods.org), create `Podfile`.  Run the following command in root folder of your project:

```bash
$ pod init
```
In the `Podfile` that appears, specify:

```ruby
platform :ios, ‘8.0’

target '<Your Target Name>' do
    use_frameworks!
    pod 'UIStoryboardReference'
end
```

Then, run the following command:

```bash
$ pod install
```

## Usage
### Storyboard
1. You must create your storyboard filenames by extension to `UIStoryboard.Filename`.

```swift
/// The safe name of the storyboard resource.
extension UIStoryboard.Filename {

    static var login: UIStoryboard.Filename {
        return UIStoryboard.Filename(name: "Login")
    }
    
    static var main: UIStoryboard.Filename {
        return UIStoryboard.Filename(name: "Main")
    }
    
    static var modal: UIStoryboard.Filename {
        return UIStoryboard.Filename(name: "Modal")
    }
}
```

2. You can create new instance of `UIStoryboard` from `UIStoryboardName`.
```swift
// Create `Login.storyboard` instance
let loginStoryboard = UIStoryboard(.login)

// Create `Main.storyboard` instance
let mainStoryboard = UIStoryboard(.main)

// Create `Modal.storyboard` instance
let modalStoryboard = UIStoryboard(.modal)
```

### ViewController
1. Try to get `instantiateInitialViewController` or `instantiateViewController` from storyboard with force casting to selected type
```swift
// First of all - you need get storyboard instance
let storyboard = UIStoryboard(UIStoryboardName.main)
    
// Next. You need try to get `instantiateInitialViewController` from storyboard with selected type. If `viewController` can't cast to selected type you fetch fatal error!
let initialViewController_0 = storyboard.initialViewController(UINavigationController.self)  

// It's the same way to get initialViewController as `initialViewController_0` but have different syntaxis. Use which is more suitable for you
let initialViewController_1: UINavigationController = storyboard.initialViewController() 

// Finally. You can try to get `instantiateViewController` with storyboard id from storyboard with selected type. If `viewController` `storyboardFilename` is not equal to Storyboard ID or can't cast to selected type you fetch fatal error!
let viewController_0 = storyboard.viewController(UITableViewController.self)

// It's the same way to get viewController as `viewController_0` but have different syntaxis. Use which is more suitable for you
let viewController_1: UITableViewController = storyboard.viewController()
```

## License
Released under the MIT license. See [LICENSE](https://github.com/YuriFox/UIStoryboardReference/blob/master/LICENSE) for details.
