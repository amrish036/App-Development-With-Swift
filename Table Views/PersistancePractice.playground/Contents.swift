//: Playground - Persistance Practice

import Foundation

struct Note: Codable{
  let title: String
  let text: String
  let timeStamp: Date
}

let newNote = Note(title: "Grocery Run", text: "Pickup Bread, milk, eggs, fruits and vegetables", timeStamp: Date())
let noteOne = Note(title: "NoteOne", text: "This is another Sample", timeStamp: Date())
let noteTwo = Note(title: "NoteTwo", text: "This is yet another sample", timeStamp: Date())

let notes = [newNote, noteOne, noteTwo]


let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveUrl = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")

let propertyListEncoder = PropertyListEncoder()
let encodedData = try? propertyListEncoder.encode(notes)

try? encodedData?.write(to: archiveUrl, options: .atomicWrite)

let propertyListDecoder = PropertyListDecoder()
if let retrievedNoteData = try? Data(contentsOf: archiveUrl),
  let decodedNote = try? propertyListDecoder.decode(Array<Note>.self, from: retrievedNoteData){
  print(decodedNote)
}
