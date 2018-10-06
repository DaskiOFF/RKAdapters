# RKAdapters

[![CI Status](https://img.shields.io/travis/DaskiOFF/RKAdapters.svg?style=flat)](https://travis-ci.org/DaskiOFF/RKAdapters)
[![Version](https://img.shields.io/cocoapods/v/RKAdapters.svg?style=flat)](https://cocoapods.org/pods/RKAdapters)
[![License](https://img.shields.io/cocoapods/l/RKAdapters.svg?style=flat)](https://cocoapods.org/pods/RKAdapters)
[![Platform](https://img.shields.io/cocoapods/p/RKAdapters.svg?style=flat)](https://cocoapods.org/pods/RKAdapters)
[![](docs/badge.svg)](https://daskioff.github.io/RKAdapters/)

- [Requirements](#requirements)
- [Documentations](#documentations)
- [Installation](#installation)
- [Usage](#usage)
- [Author](#author)
- [License](#license)
- [Info](#dependencies)

## Requirements

- iOS 9.0 and above
- Swift 4.1

## Documentations

Full documentation for the latest release is available [here](https://daskioff.github.io/RKAdapters/)

## Installation

RKAdapters is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RKAdapters', '~> 0.1'
```

## Usage

```swift
// init variant 1
var textField = UITextField()
lazy var textAdapter = TextFieldAdapter(textField: textField)

// init variant 2. TextField will be created in TextFieldAdapter
// or var textAdapter = TextFieldAdapter()

textAdapter.setShouldChangeCharacters { tf, range, string in
    // do something
}

textAdapter.setDidTextChanged { textField, text in
    // do something
}
```

## Author

DaskiOFF, waydeveloper@gmail.com

## License

RKAdapters is available under the MIT license. See the [LICENSE](LICENSE) file for more info.

## [Dependencies](https://ios-factor.com/dependencies)
Последний раз проект собирался с версией **Xcode** указанной в файле ```.xcode-version``` ([Подробнее](https://github.com/fastlane/ci/blob/master/docs/xcode-version.md))

Последний раз проект собирался с версией **Swift** указанной в файле ```.swift-version```
