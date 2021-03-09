//
//  DesignableImageView.swift
//  Flexnest_Demo
//
//  Created by Shubham Arora on 09/03/21.
//

import UIKit

@IBDesignable class DesignableImageView: UIImageView {
    
    // MARK: Circle Image
    @IBInspectable var circleImage: Bool = false {
        
        didSet {
            
            if circleImage == false {
                
                self.layer.cornerRadius = self.frame.width
                
            } else {
                
                self.layer.cornerRadius = self.frame.width/2
                self.layer.masksToBounds = true
            }
        }
    }
    
}
