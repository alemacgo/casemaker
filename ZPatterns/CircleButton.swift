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
    
    init(frame: CGRect, _ color: UIColor) {
        super.init(frame: frame)
        setDefaultAttributes()
        backgroundColor = color
    }
    
    func setDefaultAttributes() {
        //TODO: Remove magic numbers
        backgroundColor = UIColor.whiteColor()
    
        layer.cornerRadius = self.frame.size.width / 2
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0).CGColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSizeMake(0, 1)
        layer.shadowRadius = 2
    }

}
