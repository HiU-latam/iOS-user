//
//  PaymentTypeTableViewCell.swift
//  HiU
//
//  Created by Pranshi on 6/9/18.
//  Copyright © 2018 developer. All rights reserved.
//

import UIKit

class PaymentTypeTableViewCell: UITableViewCell {

    @IBOutlet weak var buttonHiu: UIButton!
    @IBOutlet weak var buttonPayU: UIButton!
    @IBOutlet weak var buttonPayPal: UIButton!
    @IBOutlet weak var buttonDone: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
