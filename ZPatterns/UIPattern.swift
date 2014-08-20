//
//  UIPattern.swift
//  ZPatterns
//
//  Created by Matt Appleby on 8/15/14.
//  Copyright (c) 2014 Zazzle. All rights reserved.
//

import Foundation

class UIPattern : NSObject {
    var paths: [UIPath]?
    
    override init() {
        paths = [UIPattern.squarePath()]
    }
    
    
    private class func squarePath() -> UIPath {
        var circle = UIBezierPath(rect: CGRectMake(0, 0, 80, 40))
        
        var path: UIPath = UIPath(path: circle, lineWidth: 1, color: UIColor.blackColor())
        return path
    }
    
    func renderPatternToContext(context: CGContextRef) {
        if (!paths!.isEmpty) {
            for p in paths! {
                p.renderToContext(context)
            }
        }
    }
    
    func renderPatternGridToContext(context: CGContextRef, factor: Int) {
        for r in 0..<factor {
            for c in 0..<factor {
                for p in paths! {
                    p.translatedPaths![r][c].renderToContext(context)
                }
            }
        }
    }
    
    func generateTranslatedPaths(tilesize: CGFloat, factor: Int) {
        if (!paths!.isEmpty) {
            for p in paths! {
                p.generateTranslatedPaths(tilesize, factor: factor)
            }
        }
    }
}