//
//  CollectionExtensions.swift
//  Flexnest_Demo
//
//  Created by Shubham Arora on 09/03/21.
//

import UIKit

extension UICollectionView {
    
    public func register<T: UICollectionViewCell>(cellType: T.Type, bundle: Bundle? = nil) {
        let className = String(describing: cellType)
        let  nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: className)
    }
    
    public func register<T: UICollectionViewCell>(cellTypes: [T.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { (cellType) in register(cellType: cellType) }
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        let className = String(describing: type)
        return dequeueReusableCell(withReuseIdentifier: className, for: indexPath) as! T
    }
    
    public func register<T: UICollectionReusableView>(supplementaryView: T.Type, of elementKind: String, bundle: Bundle? = nil) {
        let className = String(describing: supplementaryView)
        let  nib = UINib(nibName: className, bundle: bundle)
        register(nib, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: className)
    }
}
