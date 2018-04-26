//
//  MessageValueTableViewCell.swift
//  HiU
//
//  Created by Pranshi on 4/25/18.
//  Copyright © 2018 developer. All rights reserved.
//

import UIKit

class MessageValueTableViewCell: UITableViewCell {
    
    @IBOutlet weak var viewValue: UIView!
    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var niceButtonValue: NiceButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
