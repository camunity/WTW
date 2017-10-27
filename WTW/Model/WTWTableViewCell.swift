//
//  WTWTableViewCell.swift
//  WTW
//
//  Created by Cameron Flowers on 10/25/17.
//  Copyright © 2017 floreo. All rights reserved.
//

import UIKit

class WTWTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var cellImageView: UIImageView!

    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var highLabel: UILabel!

    @IBOutlet weak var lowLabel: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
