//
//  HomeCell.swift
//  ARDemo
//
//  Created by JD Patel on 12/09/19.
//  Copyright © 2019 JD. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        addSubview(holderView)
            
        [holderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
         holderView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
         holderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
         holderView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)].forEach{ $0.isActive = true }
        
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var holderView: UIView = {
          let vw = UIView()
          vw.shadow()
//          vw.backgroundColor = .white
          vw.layer.cornerRadius = 10
          vw.translatesAutoresizingMaskIntoConstraints = false
          return vw
      }()
    
}
