//
//  DelegateTableViewCell.swift
//  swiftBasic
//
//  Created by 徐沈俊杰 on 2016/12/22.
//  Copyright © 2016年 tinypace. All rights reserved.
//

import UIKit

class DelegateTableViewCell: UITableViewCell {
    
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
