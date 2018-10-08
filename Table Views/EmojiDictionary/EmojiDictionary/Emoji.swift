//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Amrish Mahesh on 16/8/18.
//  Copyright © 2018 Amrish Mahesh. All rights reserved.
//

import Foundation

class Emoji: Codable{
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
  
  static var documentDirectory = FileManager.default.urls(for: .documentDirectory , in: .userDomainMask).first!
  
  static var archiveUrl = documentDirectory.appendingPathComponent("emojis").appendingPathExtension("plist")
  
  static func saveToFile(emojis: [Emoji]){
  let propertyListEncoder = PropertyListEncoder()
  let encodedEmojis = try? propertyListEncoder.encode(emojis)
    try? encodedEmojis?.write(to: archiveUrl, options: .noFileProtection)
  }
  
  static func loadFromFile() -> [Emoji]?{
    let propertyListDecoder = PropertyListDecoder()
    var decodedEmojis: [Emoji] = []
    if let retrievedEmojis = try? Data(contentsOf: archiveUrl),
      let decodedEmoji = try? propertyListDecoder.decode(Array<Emoji>.self, from: retrievedEmojis) as [Emoji]{
     print(decodedEmoji)
      decodedEmojis =  decodedEmoji
    }
    return decodedEmojis
  }
  
  static func loadSampleEmojis(){
    
  }
}
