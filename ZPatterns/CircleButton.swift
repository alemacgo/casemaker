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
        // Called from the storyboards
        super.init(coder: coder)
        setDefaultAttributes()
    }
    
    override init(frame: CGRect) {
        // Called from code
        super.init(frame: frame)
        setDefaultAttributes()
    }
    
    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        self.backgroundColor = color
    }
    
    func setDefaultAttributes() {
        //TODO: Remove magic numbers
        self.backgroundColor = UIColor(hue: 1.0, saturation: 0.5, brightness: 1.0, alpha: 1.0)
    
        self.layer.cornerRadius = self.frame.size.width / 2
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0).CGColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSizeMake(0, 1)
        self.layer.shadowRadius = 2
    }

}
