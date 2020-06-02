//
//  extensions.swift
//  PeriodTracker
//
//  Created by Paola Castro on 6/2/20.
//  Copyright © 2020 Paola Castro. All rights reserved.
//

import UIKit


extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, size: CGSize = .zero, padding: UIEdgeInsets = .zero ) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let left = left {
            leadingAnchor.constraint(equalTo: left, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom).isActive = true
        }
        
        if let right = right {
            print("Padding Right: \(padding.right)")
            trailingAnchor.constraint(equalTo: right, constant: padding.right).isActive = true
        }
        
        if  size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if  size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
    }
}
