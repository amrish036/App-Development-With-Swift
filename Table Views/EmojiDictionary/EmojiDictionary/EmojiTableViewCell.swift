//
//  EmojiTableViewCell.swift
//  EmojiDictionary
//
//  Created by Amrish Mahesh on 25/8/18.
//  Copyright © 2018 Amrish Mahesh. All rights reserved.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {
  @IBOutlet weak var symbolLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var descriptionLabel: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  func update(with emoji: Emoji){
    self.symbolLabel.text = emoji.symbol
    self.nameLabel.text = emoji.name
    self.descriptionLabel.text = emoji.description
  }

}
