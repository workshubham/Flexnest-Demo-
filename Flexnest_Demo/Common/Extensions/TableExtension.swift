//
//  TableExtension.swift
//  Flexnest_Demo
//
//  Created by Shubham Arora on 09/03/21.
//

import UIKit

public extension UITableView {
    
    func register<T: UITableViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let className = String(describing: cellType)
        let  nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellReuseIdentifier: className)
    }
    
    func register<T: UITableViewCell>(cellTypes: [T.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { (cellType) in register(cellType: cellType) }
    }
    
    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        let className = String(describing: type)
        return self.dequeueReusableCell(withIdentifier: className, for: indexPath) as! T
    }
    
    func dequeueReusableCell<T: UITableViewCell>(with type: T.Type) -> T {
        let className = String(describing: type)
        return self.dequeueReusableCell(withIdentifier: className) as! T
    }
}
