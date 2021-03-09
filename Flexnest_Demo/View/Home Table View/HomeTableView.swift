//
//  HomeTableView.swift
//  Flexnest_Demo
//
//  Created by Shubham Arora on 09/03/21.
//

import UIKit

class HomeTableView: UITableView {
    
    // Variables and constant
    private let cells = [UserTableViewCell.self, PostTableViewCell.self]
    internal var getNextUsers: ((Bool) -> Void)?
    internal var userData: [UserViewModel] = [UserViewModel]() {
        didSet {
            reloadData()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        delegate = self
        dataSource = self
        // Registering Cell
        registerCells()
    }
    
    /// Registering cell
    private func registerCells() {
        register(cellTypes: cells)
    }
}

// MARK: TableView Methods
extension HomeTableView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if userData.count == 0 {
            return UITableViewCell()
        }
        if indexPath.section == 0 {
            let userCell = dequeueReusableCell(with: UserTableViewCell.self, for: indexPath)
            userCell.usersData = userData
            return userCell
        }
        let postCell = dequeueReusableCell(with: PostTableViewCell.self, for: indexPath)
        postCell.userPostData = userData[indexPath.row]
        return postCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if userData.count == 0 {
            return 0
        }
        if indexPath.section == 0 {
            return 120
        }
        return 360
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
        if maximumOffset - currentOffset <= 40.0 {
            getNextUsers?(true)
        } else {
            getNextUsers?(false)
        }
    }
}
