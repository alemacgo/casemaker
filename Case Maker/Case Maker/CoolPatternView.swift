
//
//  CoolPatternView.swift
//  ZPatterns
//
//  Created by Matt Appleby on 8/12/14.
//  Copyright (c) 2014 Zazzle. All rights reserved.
//

import Foundation
import UIKit

class CoolPatternView : UIView {

    func radiansFromDegrees(degrees: Double) -> Double {
        return degrees * M_PI/180;
    }
    
    override func drawRect (rect: CGRect) {
        
        var context = UIGraphicsGetCurrentContext()
        
        var bgColor: UIColor = UIColor(hue: 0.7, saturation: 0.4, brightness: 0.7, alpha: 1.0)
        CGContextSetFillColorWithColor(context, bgColor.CGColor)
        CGContextFillRect(context, rect)

        CGContextSaveGState(context)
        var patternSpace = CGColorSpaceCreatePattern(nil)
        CGContextSetFillColorSpace(context, patternSpace)
        
        var pattern = CGPatternCreate(nil, rect, CGAffineTransformIdentity, 200,200, kCGPatternTilingConstantSpacing, true, nil)
        
        var alpha: CGFloat = 1.0
        CGContextSetFillPattern(context, pattern, &alpha)
        CGContextFillRect(context, self.bounds)
        CGContextRestoreGState(context)
        
    }

}