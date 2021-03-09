//
//  PostTableViewCell.swift
//  Flexnest_Demo
//
//  Created by Shubham Arora on 09/03/21.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var userPostImgView: UIImageView!
    
    // Variables and constants
    internal var userPostData: UserViewModel! {
        didSet {
            name.text = userPostData.name
            email.text = userPostData.email
            userPostImgView.sd_setImage(with: URL(string: userPostData.avatar), placeholderImage: UIImage(named: "placeholderPost"))
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
