//
//  Pluralizer.swift
//  Pods
//
//  Created by Koji Murata on 2016/06/17.
//
//

import Foundation

public class Pluralizer {
  public func plural(pattern: String, _ replacement: String) {
    plurals.insert(Rule(pattern: pattern, replacement: replacement), atIndex: 0)
  }
  
  public func singular(pattern: String, _ replacement: String) {
    singulars.insert(Rule(pattern: pattern, replacement: replacement), atIndex: 0)
  }
  
  public func irregular(singular: String, _ plural: String) {
    self.singular("\(plural)$", singular)
    self.plural("\(singular)$", plural)
  }
  
  public func uncountable(words: String...) {
    words.forEach { uncountables.insert($0) }
  }
  
  public func plural(word: String) -> String {
    return apply(word, rules: plurals)
  }
  
  public func singular(word: String) -> String {
    return apply(word, rules: singulars)
  }
  
  private var plurals = [Rule]()
  private var singulars = [Rule]()
  private var uncountables = Set<String>()
  
  private func apply(word: String, rules: [Rule]) -> String {
    guard !uncountables.contains(word) && word != "" else { return word }
    
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
