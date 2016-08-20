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
    addPlural("s", "$")
    addPlural("s", "s$")
    addPlural("$1es", "^(ax|test)is$")
    addPlural("$1i", "(octop|vir)us$")
    addPlural("$1i", "(octop|vir)i$")
    addPlural("$1es", "(alias|status)$")
    addPlural("$1ses", "(bu)s$")
    addPlural("$1oes", "(buffal|tomat)o$")
    addPlural("$1a", "([ti])um$")
    addPlural("$1a", "([ti])a$")
    addPlural("ses", "sis$")
    addPlural("$1$2ves", "(?:([^f])fe|([lr])f)$")
    addPlural("$1s", "(hive)$")
    addPlural("$1ies", "([^aeiouy]|qu)y$")
    addPlural("$1es", "(x|ch|ss|sh)$")
    addPlural("$1ices", "(matr|vert|ind)(?:ix|ex)$")
    addPlural("$1ice", "^(m|l)ouse$")
    addPlural("$1ice", "^(m|l)ice$")
    addPlural("$1en", "^(ox)$")
    addPlural("$1", "^(oxen)$")
    addPlural("$1zes", "(quiz)$")
    
    addSingular("", "s$")
    addSingular("$1", "(ss)$")
    addSingular("$1ews", "(n)ews$")
    addSingular("$1um", "([ti])a$")
    addSingular("$1sis", "((a)naly|(b)a|(d)iagno|(p)arenthe|(p)rogno|(s)ynop|(t)he)(sis|ses)$")
    addSingular("$1sis", "(^analy)(sis|ses)$")
    addSingular("$1fe", "([^f])ves$")
    addSingular("$1", "(hive)s$")
    addSingular("$1", "(tive)s$")
    addSingular("$1f", "([lr])ves$")
    addSingular("$1y", "([^aeiouy]|qu)ies$")
    addSingular("$1eries", "(s)eries$")
    addSingular("$1ovie", "(m)ovies$")
    addSingular("$1", "(x|ch|ss|sh)es$")
    addSingular("$1ouse", "^(m|l)ice$")
    addSingular("$1", "(bus)(es)?$")
    addSingular("$1", "(o)es$")
    addSingular("$1", "(shoe)s$")
    addSingular("$1is", "(cris|test)(is|es)$")
    addSingular("$1xis", "^(a)x[ie]s$")
    addSingular("$1us", "(octop|vir)(us|i)$")
    addSingular("$1", "(alias|status)(es)?$")
    addSingular("$1", "^(ox)en")
    addSingular("$1ex", "(vert|ind)ices$")
    addSingular("$1ix", "(matr)ices$")
    addSingular("$1", "(quiz)zes$")
    addSingular("$1", "(database)s$")
    
    addIrregular("people", "person")
    addIrregular("men", "man")
    addIrregular("children", "child")
    addIrregular("sexes", "sex")
    addIrregular("moves", "move")
    addIrregular("zombies", "zombie")
    
    addUncountable("equipment", "information", "rice", "money", "species", "series", "fish", "sheep", "jeans", "police")
  }
}
