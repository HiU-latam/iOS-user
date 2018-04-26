//
//  MessageLuckyNameTableViewCell.swift
//  HiU
//
//  Created by Pranshi on 4/1/18.
//  Copyright © 2018 developer. All rights reserved.
//

import UIKit

class MessageLuckyNameTableViewCell: UITableViewCell {

    @IBOutlet weak var labelLuckyOne: UILabel!
    @IBOutlet weak var viewLuckOne: UIView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var textViewName: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
