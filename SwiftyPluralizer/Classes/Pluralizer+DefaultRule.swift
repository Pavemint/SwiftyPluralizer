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
    addPlural("$", "s")
    addPlural("s$", "s")
    addPlural("^(ax|test)is$", "$1es")
    addPlural("(octop|vir)us$", "$1i")
    addPlural("(octop|vir)i$", "$1i")
    addPlural("(alias|status)$", "$1es")
    addPlural("(bu)s$", "$1ses")
    addPlural("(buffal|tomat)o$", "$1oes")
    addPlural("([ti])um$", "$1a")
    addPlural("([ti])a$", "$1a")
    addPlural("sis$", "ses")
    addPlural("(?:([^f])fe|([lr])f)$", "$1$2ves")
    addPlural("(hive)$", "$1s")
    addPlural("([^aeiouy]|qu)y$", "$1ies")
    addPlural("(x|ch|ss|sh)$", "$1es")
    addPlural("(matr|vert|ind)(?:ix|ex)$", "$1ices")
    addPlural("^(m|l)ouse$", "$1ice")
    addPlural("^(m|l)ice$", "$1ice")
    addPlural("^(ox)$", "$1en")
    addPlural("^(oxen)$", "$1")
    addPlural("(quiz)$", "$1zes")
    
    addSingular("s$", "")
    addSingular("(ss)$", "$1")
    addSingular("(n)ews$", "$1ews")
    addSingular("([ti])a$", "$1um")
    addSingular("((a)naly|(b)a|(d)iagno|(p)arenthe|(p)rogno|(s)ynop|(t)he)(sis|ses)$", "$1sis")
    addSingular("(^analy)(sis|ses)$", "$1sis")
    addSingular("([^f])ves$", "$1fe")
    addSingular("(hive)s$", "$1")
    addSingular("(tive)s$", "$1")
    addSingular("([lr])ves$", "$1f")
    addSingular("([^aeiouy]|qu)ies$", "$1y")
    addSingular("(s)eries$", "$1eries")
    addSingular("(m)ovies$", "$1ovie")
    addSingular("(x|ch|ss|sh)es$", "$1")
    addSingular("^(m|l)ice$", "$1ouse")
    addSingular("(bus)(es)?$", "$1")
    addSingular("(o)es$", "$1")
    addSingular("(shoe)s$", "$1")
    addSingular("(cris|test)(is|es)$", "$1is")
    addSingular("^(a)x[ie]s$", "$1xis")
    addSingular("(octop|vir)(us|i)$", "$1us")
    addSingular("(alias|status)(es)?$", "$1")
    addSingular("^(ox)en", "$1")
    addSingular("(vert|ind)ices$", "$1ex")
    addSingular("(matr)ices$", "$1ix")
    addSingular("(quiz)zes$", "$1")
    addSingular("(database)s$", "$1")
    
    addIrregular("person", "people")
    addIrregular("man", "men")
    addIrregular("child", "children")
    addIrregular("sex", "sexes")
    addIrregular("move", "moves")
    addIrregular("zombie", "zombies")
    
    addUncountable("equipment", "information", "rice", "money", "species", "series", "fish", "sheep", "jeans", "police")
  }
}
