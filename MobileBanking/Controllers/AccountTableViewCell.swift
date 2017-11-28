//
//  AccountTableViewCell.swift
//  MobileBanking
//
//  Created by Andrew Webber on 11/27/17.
//  Copyright © 2017 Andrew Webber. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    @IBOutlet weak var lblAmount: UILabel!
    @IBOutlet weak var lblAccount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
