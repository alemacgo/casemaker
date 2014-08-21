//
//  UIPath.swift
//  ZPatterns
//
//  Created by Matt Appleby on 8/15/14.
//  Copyright (c) 2014 Zazzle. All rights reserved.
//

import Foundation

class UIPath : NSObject {
    
    var path: UIBezierPath
    var color: UIColor
    var translatedPaths: Array<Array<UIPath>>?
    
    init(path: UIBezierPath, lineWidth: CGFloat, color: UIColor) {
        self.path = path
        self.path.lineWidth = lineWidth
        self.color = color
        super.init()
    }
    
    convenience override init() {
        self.init(path: UIBezierPath(), lineWidth: 1, color: UIColor.clearColor())
    }
    
    func setPath(newPath: UIBezierPath) {
        path = newPath
    }
    
    func renderToContext(context: CGContextRef) {
        color.setFill()
        path.fill()
    }
    
    func generateTranslatedPaths(tilesize: CGFloat, factor: Int){
        var pathArray = Array(count: factor, repeatedValue: Array(count: factor, repeatedValue: UIPath()))
        let size = tilesize
        
        for r in 0..<factor {
            for c in 0..<factor {
                var translation = CGAffineTransformMakeTranslation(CGFloat(r)*size, CGFloat(c)*size)
                var newPath = CGPathCreateCopyByTransformingPath(self.path.CGPath, &translation)
                
                pathArray[r][c] = UIPath(path: UIBezierPath(CGPath: newPath), lineWidth: self.path.lineWidth, color: self.color)
            }
        }
        
        translatedPaths = pathArray
    }
    
    func setColor(color: UIColor) {
        self.color = color
    }
}