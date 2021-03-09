//
//  NoInternetView.swift
//  Flexnest_Demo
//
//  Created by Shubham Arora on 09/03/21.
//

import UIKit

class NoInternetView: UIView {
    
    static let shared = NoInternetView()
    
    lazy var lblTitle: UILabel = {
        var lbl = UILabel()
        lbl.font = UIFont(name: "HelveticaNeue-Bold", size: 12)
        lbl.textColor = UIColor.white
        return lbl
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        settingUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        settingUpView()
    }
    
    /// Setting up view
    func settingUpView() {
        if let keyWindow = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
            frame = CGRect(x: 0, y: UIScreen.main.bounds.height - (keyWindow.safeAreaInsets.bottom + 20), width: UIScreen.main.bounds.width, height: 20)
        }
        addSubview(lblTitle)
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive = true
        lblTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }
    
    /// Changing view according to internet connection
    func settingInternetView(title: String, color: UIColor) {
        lblTitle.text = title
        backgroundColor = color
    }
}

