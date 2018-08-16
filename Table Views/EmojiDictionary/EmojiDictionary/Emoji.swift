//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Amrish Mahesh on 16/8/18.
//  Copyright © 2018 Amrish Mahesh. All rights reserved.
//

import Foundation

class Emoji{
  var symbol: String
  var name: String
  var description: String
  var usage: String
  
  init(symbol: String, name: String, description: String, usage: String) {
    self.symbol = symbol
    self.name = name
    self.description = description
    self.usage = usage
  }
}
