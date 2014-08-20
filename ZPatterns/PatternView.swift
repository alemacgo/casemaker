//
//  PatternView.swift
//  ZPatterns
//
//  Created by Matt Appleby on 8/15/14.
//  Copyright (c) 2014 Zazzle. All rights reserved.
//

import Foundation

class PatternView : UIView {
    override func drawRect(rect: CGRect) {
        var pattern: Pattern = Pattern()
        
        let context = UIGraphicsGetCurrentContext()
        
        pattern.renderPatternToContext(context)
        
    }
}