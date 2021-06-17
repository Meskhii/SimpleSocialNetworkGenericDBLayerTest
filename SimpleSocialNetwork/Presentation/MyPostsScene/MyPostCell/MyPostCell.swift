//
//  MyPostCell.swift
//  SimpleSocialNetwork
//
//  Created by Admin on 17.06.2021.
//

import UIKit

class MyPostCell: UITableViewCell {

    @IBOutlet weak var myPostImageView: UIImageView!
    @IBOutlet weak var myPostTitleLabel: UILabel!
    @IBOutlet weak var myPostDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
