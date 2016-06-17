//
//  Pluralizer+DefaultRule.swift
//  Pods
//
//  Created by Koji Murata on 2016/06/17.
//
//

import Foundation

extension Pluralizer {
  public static let defaultInstance = Pluralizer.createDefaultInstance()

  internal static func createDefaultInstance() -> Pluralizer {
    let pluralizer = Pluralizer()
    pluralizer.appendDefaultRules()
    return pluralizer
  }
  
  // create this method from Ruby on Rails
  // https://github.com/rails/rails/blob/master/activesupport/lib/active_support/inflections.rb
  internal func appendDefaultRules() {
    plural("$", "s")
    plural("s$", "s")
    plural("^(ax|test)is$", "$1es")
    plural("(octop|vir)us$", "$1i")
    plural("(octop|vir)i$", "$1i")
    plural("(alias|status)$", "$1es")
    plural("(bu)s$", "$1ses")
    plural("(buffal|tomat)o$", "$1oes")
    plural("([ti])um$", "$1a")
    plural("([ti])a$", "$1a")
    plural("sis$", "ses")
    plural("(?:([^f])fe|([lr])f)$", "$1$2ves")
    plural("(hive)$", "$1s")
    plural("([^aeiouy]|qu)y$", "$1ies")
    plural("(x|ch|ss|sh)$", "$1es")
    plural("(matr|vert|ind)(?:ix|ex)$", "$1ices")
    plural("^(m|l)ouse$", "$1ice")
    plural("^(m|l)ice$", "$1ice")
    plural("^(ox)$", "$1en")
    plural("^(oxen)$", "$1")
    plural("(quiz)$", "$1zes")
    
    singular("s$", "")
    singular("(ss)$", "$1")
    singular("(n)ews$", "$1ews")
    singular("([ti])a$", "$1um")
    singular("((a)naly|(b)a|(d)iagno|(p)arenthe|(p)rogno|(s)ynop|(t)he)(sis|ses)$", "$1sis")
    singular("(^analy)(sis|ses)$", "$1sis")
    singular("([^f])ves$", "$1fe")
    singular("(hive)s$", "$1")
    singular("(tive)s$", "$1")
    singular("([lr])ves$", "$1f")
    singular("([^aeiouy]|qu)ies$", "$1y")
    singular("(s)eries$", "$1eries")
    singular("(m)ovies$", "$1ovie")
    singular("(x|ch|ss|sh)es$", "$1")
    singular("^(m|l)ice$", "$1ouse")
    singular("(bus)(es)?$", "$1")
    singular("(o)es$", "$1")
    singular("(shoe)s$", "$1")
    singular("(cris|test)(is|es)$", "$1is")
    singular("^(a)x[ie]s$", "$1xis")
    singular("(octop|vir)(us|i)$", "$1us")
    singular("(alias|status)(es)?$", "$1")
    singular("^(ox)en", "$1")
    singular("(vert|ind)ices$", "$1ex")
    singular("(matr)ices$", "$1ix")
    singular("(quiz)zes$", "$1")
    singular("(database)s$", "$1")
    
    irregular("person", "people")
    irregular("man", "men")
    irregular("child", "children")
    irregular("sex", "sexes")
    irregular("move", "moves")
    irregular("zombie", "zombies")
    
    uncountable("equipment", "information", "rice", "money", "species", "series", "fish", "sheep", "jeans", "police")
  }
}
