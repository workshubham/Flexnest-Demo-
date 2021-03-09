//
//  HomeShimmerTableView.swift
//  Flexnest_Demo
//
//  Created by Shubham Arora on 10/03/21.
//

import UIKit

class HomeShimmerTableView: UITableView {

    private let cell = PostShimmerTableViewCell.self
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        // Setting up search shimmer tableView
        settingUpShimmer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Setting up search shimmer tableView
        settingUpShimmer()
    }
    
    /// Setting up delegates and data source
    private func settingUpShimmer() {
        // Register cell
        registerCell()
        isUserInteractionEnabled = false
        dataSource = self
        delegate = self
    }
    
    /// Registering Cell
    private func registerCell() {
        register(cellType: cell)
    }

}

// MARK: TableView
extension HomeShimmerTableView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let shimmerCell = tableView.dequeueReusableCell(with: PostShimmerTableViewCell.self, for: indexPath)
        return shimmerCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 360
    }

}
