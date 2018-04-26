//
//  MessageTableViewCell.swift
//  HiU
//
//  Created by Pranshi on 4/14/18.
//  Copyright © 2018 developer. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var viewMessage: UIView!
    @IBOutlet weak var labelWords: UILabel!
    @IBOutlet weak var textViewWords: UITextView!
    @IBOutlet weak var labelCharacter: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
