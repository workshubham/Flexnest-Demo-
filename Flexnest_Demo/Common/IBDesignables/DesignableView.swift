//
//  DesignableView.swift
//  Flexnest_Demo
//
//  Created by Shubham Arora on 10/03/21.
//

import Foundation

@IBDesignable class DesignableView: UIView {
    
    // MARK: Border
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        
        didSet {
            
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        
        didSet {
            
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        
        didSet {
            
            layer.cornerRadius = cornerRadius
        }
        
    }
    
    @IBInspectable var maskedTopCorners: Bool = false {
        didSet {
            if maskedTopCorners == true {
                self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
                clipsToBounds = true
            } else {
                self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
            }
        }
    }
    
    // MARK: Shadow
    @IBInspectable var shadowOpacity: Float = 0.0 {
        
        didSet {
            
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        
        didSet {
            
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0.0 {
        
        didSet {
            
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize.zero {
        
        didSet {
            
            layer.masksToBounds = false
            layer.shadowOffset = shadowOffset
        }
    }
}
