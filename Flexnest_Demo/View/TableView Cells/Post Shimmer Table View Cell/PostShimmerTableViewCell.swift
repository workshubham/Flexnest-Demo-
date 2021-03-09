//
//  PostShimmerTableViewCell.swift
//  Flexnest_Demo
//
//  Created by Shubham Arora on 10/03/21.
//

import UIKit

class PostShimmerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameView: DesignableView!
    @IBOutlet weak var emailView: DesignableView!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
