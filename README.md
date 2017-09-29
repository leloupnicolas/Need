[![License](https://img.shields.io/cocoapods/l/PKHUD.svg?style=flat)](https://cocoapods.org/pods/PKHUD) 
[![Platform](https://img.shields.io/cocoapods/p/Need.svg?style=flat)](http://cocoadocs.org/docsets/Need/1.0.0/)
[![CocoaPod](https://img.shields.io/cocoapods/v/Need.svg?style=flat)](https://cocoapods.org/pods/Need)


A **Swift** based Dependency Injection implementation. Wherever you **Need** a service, you can get it.

## Features
- Service Locator
- Services injection aware utility class.


## Installation
**The only way is to use CocoaPods.**

### CocoaPods

To install Need, include the following in your Podfile

```ruby
  pod 'Need', '~> 1.0'
```

## How To

After adding the framework to your project, you need to import the module in your `AppDelegate`

```swift
import Need
```

Now, a `LazyServiceLocator` attribute to your `AppDelegate` :

```swift
  /// The main service locator
  let lazyServiceLocator: LazyServiceLocator = LazyServiceLocator()
```  

Add the following before the return statement of the `application(_ application:didFinishLaunchingWithOptions:)` method:


```swift
  self.processRegistration()
```

To finish, implement the `ServicesRegistry' protocol as the following:

```swift
extension AppDelegate: ServicesRegistry {
  var serviceLocator: ServiceLocator {
    return self.lazyServiceLocator
  }

  func processRegistration() {
    // Add here your own services
    // self.lazyServiceLocator.addService(OwnServiceImplementation() as OwnServiceProtocol)
  }
}
```


## Contributing

- If you **need help**, **have a feature request** or **found a bug**, open an issue.
- If you **want to contribute**, submit a pull request.


## Credits

Need is owned and maintained by Nicolas LELOUP [@leloupnicolas](https://twitter.com/leloupnicolas).


## License

This project is licensed under the MIT license.

Copyright (c) 2017 Nicolas LELOUP

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.