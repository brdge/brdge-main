//
//  MediaCell.swift
//  Brdge
//
//  Created by Andre Campbell on 3/25/19.
//  Copyright © 2019 awBell. All rights reserved.
//

import UIKit

class MediaCell: UITableViewCell {
    
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
