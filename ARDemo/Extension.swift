//
//  Extension.swift
//  ARDemo
//
//  Created by JD Patel on 12/09/19.
//  Copyright © 2019 JD. All rights reserved.
//

import  UIKit

extension UIColor {
    
    //Testing
    public class var random: UIColor {
        return UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
    }
    
    
}


extension UIView {
    
    func shadow() {
        
        layer.shadowColor = UIColor(red: 123/255, green: 123/255, blue: 123/255, alpha: 0.21).cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 8
        
    }
    
}
