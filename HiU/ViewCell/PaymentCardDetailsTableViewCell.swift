//
//  PaymentCardDetailsTableViewCell.swift
//  HiU
//
//  Created by Pranshi on 6/7/18.
//  Copyright © 2018 developer. All rights reserved.
//

import UIKit

class PaymentCardDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var viewCardDetails: UIView!
    @IBOutlet weak var labelCardNumber: UILabel!
    @IBOutlet weak var textCardNumber: UITextField!
    @IBOutlet weak var viewExpDate: UIView!
    @IBOutlet weak var labelExpDate: UILabel!
    @IBOutlet weak var textExpDate: UITextField!
    @IBOutlet weak var viewCVV: UIView!
    @IBOutlet weak var labelCVV: UILabel!
    @IBOutlet weak var textCVV: UITextField!
    @IBOutlet weak var viewCardName: UIView!
    @IBOutlet weak var labelCardName: UILabel!
    @IBOutlet weak var textCardName: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
