//
//  Pluralizer.swift
//  Pods
//
//  Created by Koji Murata on 2016/06/17.
//
//

import Foundation

open class Pluralizer {
  open func addPlural(_ pattern: String, _ replacement: String) {
    plurals.insert(Rule(pattern: pattern, replacement: replacement), at: 0)
  }
  
  open func addSingular(_ pattern: String, _ replacement: String) {
    singulars.insert(Rule(pattern: pattern, replacement: replacement), at: 0)
  }
  
  open func addIrregular(_ singular: String, _ plural: String) {
    addSingular("\(plural)$", singular)
    addPlural("\(singular)$", plural)
  }
  
  open func addUncountable(_ words: String...) {
    uncountables.append(words)
  }
  
  open func plural(_ word: String) -> String {
    return apply(word, rules: plurals)
  }
  
  open func singular(_ word: String) -> String {
    return apply(word, rules: singulars)
  }
  
  fileprivate var plurals = [Rule]()
  fileprivate var singulars = [Rule]()
  fileprivate var uncountables = Uncountables()
  
  fileprivate func apply(_ word: String, rules: [Rule]) -> String {
    guard !uncountables.match(word) && word != "" else { return word }
    
    for rule in rules {
      if let result = rule.apply(word) { return result }
    }
    
    return word
  }
}

private struct Rule {
  let pattern: String
  let replacement: String
  
  fileprivate func apply(_ word: String) -> String? {
    guard let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) else { return nil }
    let range = NSMakeRange(0, word.count)
    guard regex.matches(in: word, options: [], range: range).count > 0 else { return nil }
    return regex.stringByReplacingMatches(in: word, options: [], range: range, withTemplate: replacement)
  }
}

private struct Uncountables {
  fileprivate var patterns = [String]()
  
  fileprivate mutating func append(_ patterns: [String]) {
    self.patterns += patterns.map { "\($0)$" }
  }
  
  fileprivate func match(_ word: String) -> Bool {
    for pattern in patterns {
      guard let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) else { continue }
      let range = NSMakeRange(0, word.count)
      if regex.matches(in: word, options: [], range: range).count > 0 { return true }
    }
    return false
  }
}
