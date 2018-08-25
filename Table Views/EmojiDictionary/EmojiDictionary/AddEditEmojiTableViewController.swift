//
//  AddEditEmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Amrish Mahesh on 25/8/18.
//  Copyright © 2018 Amrish Mahesh. All rights reserved.
//

import UIKit


class AddEditEmojiTableViewController: UITableViewController {
  
  var emoji: Emoji?
  
  @IBOutlet weak var symbolTextField: UITextField!
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var descriptionTextField: UITextField!
  @IBOutlet weak var usageTextField: UITextField!
  
  @IBOutlet weak var saveButton: UIBarButtonItem!
  
  
  override func viewDidLoad() {
        super.viewDidLoad()

    if let emoji = emoji {
      symbolTextField.text = emoji.symbol
      nameTextField.text = emoji.name
      descriptionTextField.text = emoji.description
      usageTextField.text = emoji.usage
    }
    
    updateSaveButtonState()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func updateSaveButtonState(){
    let symbolText = symbolTextField.text ?? ""
    let nameText = nameTextField.text ?? ""
    let descriptionText = descriptionTextField.text ?? ""
    let usageText = usageTextField.text ?? ""
   
    saveButton.isEnabled = !symbolText.isEmpty && !nameText.isEmpty && !descriptionText.isEmpty && !usageText.isEmpty
  }

    // MARK: - Table view data source



  @IBAction func textEditChanged(_ sender: UITextField){
    updateSaveButtonState()
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard segue.identifier == "saveUnwind" else{return}

    let symbol = symbolTextField.text ?? ""
    let name = nameTextField.text ?? ""
    let description = descriptionTextField.text ?? ""
    let usage = usageTextField.text ?? ""
    
    emoji = Emoji(symbol: symbol, name: name, description: description, usage: usage)
    
  }

}
