//
//  Path.swift
//  ZPatterns
//
//  Created by Matt Appleby on 8/15/14.
//  Copyright (c) 2014 Zazzle. All rights reserved.
//

import Foundation

class Path : NSObject {
    
    var path: CGPathRef
    var drawMode: CGPathDrawingMode
    var strokeWidth: CGFloat
    var color: UIColor
    
    init(path: CGPathRef, drawMode: CGPathDrawingMode, strokeWidth: CGFloat, color: UIColor) {
        self.path = path
        self.drawMode = drawMode
        self.strokeWidth = strokeWidth
        self.color = color
        super.init()
    }

    func setPath(newPath: CGPathRef) {
        if (!CGPathEqualToPath(path, newPath)) {
            path = newPath
        }
    }
    
    func renderToContext(context: CGContextRef) {
        CGContextAddPath(context, path)
        color.set()
        CGContextSetLineWidth(context, strokeWidth)
        CGContextDrawPath(context, drawMode)
    }
}