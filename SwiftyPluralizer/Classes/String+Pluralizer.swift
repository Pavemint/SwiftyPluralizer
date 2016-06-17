//
//  String+Pluralizer.swift
//  Pods
//
//  Created by Koji Murata on 2016/06/17.
//
//

import Foundation

extension String {
  public var plural: String {
    return Pluralizer.defaultInstance.plural(self)
  }
  
  public var singular: String {
    return Pluralizer.defaultInstance.singular(self)
  }
  
  public mutating func pluralize() {
    self = Pluralizer.defaultInstance.plural(self)
  }
  
  public mutating func singularize() {
    self = Pluralizer.defaultInstance.singular(self)
  }
}
