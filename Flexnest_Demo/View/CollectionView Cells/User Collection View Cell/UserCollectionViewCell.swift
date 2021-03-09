//
//  UserCollectionViewCell.swift
//  Flexnest_Demo
//
//  Created by Shubham Arora on 09/03/21.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {

    // Outlets
    @IBOutlet weak var userImg: DesignableImageView!
    
    // Variants and constants
    internal var user: UserViewModel! {
        didSet {
            userImg.sd_setImage(with: URL(string: user.avatar), placeholderImage: UIImage(named: "placeholderUser"))
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
