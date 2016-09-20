//
//  SharedTableViewCell.swift
//  fbshare
//
//  Created by wanlu wei on 2016-09-18.
//  Copyright © 2016 wanlu wei. All rights reserved.
//

import UIKit

class SharedTableViewCell: UITableViewCell {

    @IBOutlet weak var LableTitle: UILabel!

    @IBOutlet weak var ButtonShare: FBSDKShareButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
