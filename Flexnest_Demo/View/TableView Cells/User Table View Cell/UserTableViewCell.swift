//
//  UserTableViewCell.swift
//  Flexnest_Demo
//
//  Created by Shubham Arora on 09/03/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var collectionView: UserCollectionView!
    
    // Outlets
    internal var usersData: [UserViewModel] = [UserViewModel]() {
        didSet {
            collectionView.usersData = usersData
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
