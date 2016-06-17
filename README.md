# SwiftyPluralizer

This pod is referencing [Ruby on Rails rules](https://github.com/rails/rails/blob/master/activesupport/lib/active_support/inflections.rb).


[![Platform](https://img.shields.io/cocoapods/p/SwiftyPluralizer.svg?style=flat)](http://cocoapods.org/pods/SwiftyPluralizer)
[![CI Status](http://img.shields.io/travis/malt03/SwiftyPluralizer.svg?style=flat)](https://travis-ci.org/Koji Murata/SwiftyPluralizer)
[![Version](https://img.shields.io/cocoapods/v/SwiftyPluralizer.svg?style=flat)](http://cocoapods.org/pods/SwiftyPluralizer)
![Language](https://img.shields.io/badge/language-Swift%202.2-orange.svg)
![License](https://img.shields.io/github/license/malt03/SwiftyPluralizer.svg?style=flat)

## Usage

### Pluralize and Singularize 
```swift
var plural = "person".plural // => people
plural.singularize() // => change person

var singular = "people".singular // => person
singular.pluralize() // => change people
```

### Add rules
```swift
Pluralizer.defaultInstance.addPlural("(quiz)$", "$1zes")
Pluralizer.defaultInstance.addSingular("(quiz)zes$", "$1")
Pluralizer.defaultInstance.addIrregular("person", "people")
```

## Installation

SwiftyPluralizer is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SwiftyPluralizer"
```

## Author

Koji Murata, malt.koji@gmail.com

## License

SwiftyPluralizer is available under the MIT license. See the LICENSE file for more info.
