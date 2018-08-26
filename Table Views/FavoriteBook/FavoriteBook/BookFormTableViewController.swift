//
//  BookFormTableViewController.swift
//  FavoriteBooks
//
//  Created by Amrish Mahesh on 26/8/18.
//

import UIKit

class BookFormTableViewController: UITableViewController {

  struct PropertyKeys {
    static let unwind = "UnwindToBookTable"
  }
  
  var book: Book?
  
  @IBOutlet weak var titleTextField: UITextField!
  @IBOutlet weak var authorTextField: UITextField!
  @IBOutlet weak var genreTextField: UITextField!
  @IBOutlet weak var lengthTextField: UITextField!
  
  @IBAction func saveButtonTapped(_ sender: Any) {
  
    guard let title = titleTextField.text,
      let author = authorTextField.text,
      let genre = genreTextField.text,
      let length = lengthTextField.text else {return}
    
    book = Book(title: title, author: author, genre: genre, length: length)
    performSegue(withIdentifier: PropertyKeys.unwind, sender: self)
  
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
        updateView()
    }
  
  func updateView() {
    guard let book = book else {return}
    
    titleTextField.text = book.title
    authorTextField.text = book.author
    genreTextField.text = book.genre
    lengthTextField.text = book.length
  }

}
