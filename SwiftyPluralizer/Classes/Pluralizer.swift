//
//  Pluralizer.swift
//  Pods
//
//  Created by Koji Murata on 2016/06/17.
//
//

import Foundation

public class Pluralizer {
  public func addPlural(pattern: String, _ replacement: String) {
    plurals.insert(Rule(pattern: pattern, replacement: replacement), atIndex: 0)
  }
  
  public func addSingular(pattern: String, _ replacement: String) {
    singulars.insert(Rule(pattern: pattern, replacement: replacement), atIndex: 0)
  }
  
  public func addIrregular(singular: String, _ plural: String) {
    addSingular("\(plural)$", singular)
    addPlural("\(singular)$", plural)
  }
  
  public func addUncountable(words: String...) {
    uncountables.append(words)
  }
  
  public func plural(word: String) -> String {
    return apply(word, rules: plurals)
  }
  
  public func singular(word: String) -> String {
    return apply(word, rules: singulars)
  }
  
  private var plurals = [Rule]()
  private var singulars = [Rule]()
  private var uncountables = Uncountables()
  
  private func apply(word: String, rules: [Rule]) -> String {
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
  
  internal func apply(word: String) -> String? {
    guard let regex = try? NSRegularExpression(pattern: pattern, options: .CaseInsensitive) else { return nil }
    let range = NSMakeRange(0, word.characters.count)
    guard regex.matchesInString(word, options: [], range: range).count > 0 else { return nil }
    return regex.stringByReplacingMatchesInString(word, options: [], range: range, withTemplate: replacement)
  }
}

private struct Uncountables {
  private var patterns = [String]()
  
  internal mutating func append(patterns: [String]) {
    self.patterns += patterns.map { "\($0)$" }
  }
  
  internal func match(word: String) -> Bool {
    for pattern in patterns {
      guard let regex = try? NSRegularExpression(pattern: pattern, options: .CaseInsensitive) else { continue }
      let range = NSMakeRange(0, word.characters.count)
      if regex.matchesInString(word, options: [], range: range).count > 0 { return true }
    }
    return false
  }
}
