//
//  CircleButton.swift
//  ZPatterns
//
//  Created by Alejandro on 10/10/14.
//  Copyright (c) 2014 Zazzle. All rights reserved.
//

import UIKit

class CircleButton: UIButton {

    required init(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = UIColor(red: 0.961, green: 0.478, blue: 0.490, alpha: 1.0)
        
        self.layer.cornerRadius = self.frame.size.width / 2
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0).CGColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSizeMake(0, 1)
        self.layer.shadowRadius = 2
    }

}
