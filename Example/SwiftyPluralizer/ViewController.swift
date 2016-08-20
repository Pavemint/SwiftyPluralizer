//
//  ViewController.swift
//  SwiftyPluralizer
//
//  Created by Koji Murata on 06/17/2016.
//  Copyright (c) 2016 Koji Murata. All rights reserved.
//

import UIKit
import SwiftyPluralizer

class ViewController: UITableViewController {
  fileprivate let singulars = [
    "search",
    "switch",
    "fix",
    "box",
    "process",
    "address",
    "case",
    "stack",
    "wish",
    "fish",
    "jeans",
    "funky jeans",
    "my money",
    
    "category",
    "query",
    "ability",
    "agency",
    "movie",
    
    "archive",
    
    "index",
    
    "wife",
    "safe",
    "half",
    
    "move",
    
    "salesperson",
    "person",
    
    "spokesman",
    "man",
    "woman",
    
    "basis",
    "diagnosis",
    "diagnosis_a",
    
    "datum",
    "medium",
    "stadium",
    "analysis",
    "my_analysis",
    
    "node_child",
    "child",
    
    "experience",
    "day",
    
    "comment",
    "foobar",
    "newsletter",
    
    "old_news",
    "news",
    
    "series",
    "miniseries",
    "species",
    
    "quiz",
    
    "perspective",
    
    "ox",
    "photo",
    "buffalo",
    "tomato",
    "dwarf",
    "elf",
    "information",
    "equipment",
    "bus",
    "status",
    "status_code",
    "mouse",
    
    "louse",
    "house",
    "octopus",
    "virus",
    "alias",
    "portfolio",
    
    "vertex",
    "matrix",
    "matrix_fu",
    
    "axis",
    "taxi",
    "testis",
    "crisis",
    
    "rice",
    "shoe",
    
    "horse",
    "prize",
    "edge",
    
    "database",
    
    "|ice",
    "|ouse",
    "slice",
    "police",
  ]

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return singulars.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
    let singular = singulars[(indexPath as NSIndexPath).row]
    cell.textLabel?.text = singular
    cell.detailTextLabel?.text = "Plural: " + singular.plural
    return cell
  }
}

