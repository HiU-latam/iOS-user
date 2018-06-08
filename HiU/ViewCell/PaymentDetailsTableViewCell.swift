//
//  PaymentDetailsTableViewCell.swift
//  HiU
//
//  Created by Pranshi on 6/6/18.
//  Copyright © 2018 developer. All rights reserved.
//

import UIKit

class PaymentDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var labelPaymentDetails: UILabel!
    @IBOutlet weak var labelMessage: UILabel!
    @IBOutlet weak var labelMessageAmount: UILabel!
    @IBOutlet weak var labelCharity: UILabel!
    @IBOutlet weak var labelCharityAmount: UILabel!
    @IBOutlet weak var labelTotal: UILabel!
    @IBOutlet weak var labelTotalAmount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
