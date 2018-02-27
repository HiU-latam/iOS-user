//
//  DashboardTableViewCell.swift
//  HiU
//
//  Created by Pranshi on 2/20/18.
//  Copyright © 2018 developer. All rights reserved.
//

import UIKit

class DashboardTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewCelebrity: UIImageView!
    @IBOutlet weak var buttonDelete: UIButton!
    @IBOutlet weak var buttonAdd: UIButton!
    @IBOutlet weak var buttonEmail: UIButton!
    @IBOutlet weak var buttonFavorite: UIButton!
    @IBOutlet weak var buttonCloud: UIButton!
    @IBOutlet weak var viewProfile: UIView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var imageViewRatingBG: UIImageView!
    @IBOutlet weak var imageViewRating: UIImageView!
    @IBOutlet weak var labelRating: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
