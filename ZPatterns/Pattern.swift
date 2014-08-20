//
//  Tile.swift
//  ZPatterns
//
//  Created by Matt Appleby on 8/15/14.
//  Copyright (c) 2014 Zazzle. All rights reserved.
//

import Foundation

class Pattern : NSObject {
    var tileWidth: CGFloat = 10
    var tileHeight: CGFloat = 10
    var paths: [Path]?
    
    override init() {
        paths = [Pattern.stripePath(tileWidth, h: tileHeight)]
    }
    
    private class func stripePath(w: CGFloat, h: CGFloat) -> Path {

        var stripe: CGMutablePathRef = CGPathCreateMutable()
        CGPathMoveToPoint(stripe, nil, 0, 0)
        CGPathAddLineToPoint(stripe, nil, 0, h/2)
        CGPathAddLineToPoint(stripe, nil, w, h/2)
        CGPathAddLineToPoint(stripe, nil, w, 0)
        CGPathCloseSubpath(stripe)
        
        var path: Path = Path(path: stripe, drawMode: kCGPathFill, strokeWidth: 10, color: UIColor.blackColor())
        return path
    }
    
    func renderPatternToContext(context: CGContextRef) {
        if (!paths!.isEmpty) {
            for p in paths! {
                p.renderToContext(context)
            }
        }
    }
}