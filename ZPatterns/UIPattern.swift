//
//  UIPattern.swift
//  ZPatterns
//
//  Created by Matt Appleby on 8/15/14.
//  Copyright (c) 2014 Zazzle. All rights reserved.
//

import Foundation

class UIPattern {
    var paths: [UIPath]?
    var color: patternColor
    
    init() {
        color = patternColor(hue: 1.0, saturation: 1.0, brightness: 1.0)
        paths = [UIPattern.chevron(UIPattern.UIColorFromPatternColor(color))]
    }
    
    struct patternColor {
        var hue: CGFloat
        var saturation: CGFloat
        var brightness: CGFloat
    }
    
    private class func UIColorFromPatternColor(col: patternColor) -> UIColor {
        return UIColor(hue: col.hue, saturation: col.saturation, brightness: col.brightness, alpha: 1.0)
    }
    
    private class func squarePath(color: UIColor) -> UIPath {
        var circle = UIBezierPath(rect: CGRectMake(0, 0, 80, 40))
        
        var path: UIPath = UIPath(path: circle, lineWidth: 1, color: color.colorWithAlphaComponent(0.2))
        return path
    }
    
    private class func chevron(color: UIColor) -> UIPath {
        var chevron = UIBezierPath()
        chevron.moveToPoint(CGPointMake(40, 0))
        chevron.addLineToPoint(CGPointMake(0, 40))
        chevron.addLineToPoint(CGPointMake(0, 80))
        chevron.addLineToPoint(CGPointMake(40, 40))
        chevron.addLineToPoint(CGPointMake(80, 80))
        chevron.addLineToPoint(CGPointMake(80, 40))
        chevron.addLineToPoint(CGPointMake(40, 0))
        chevron.closePath()
        
        var path: UIPath = UIPath(path: chevron, lineWidth: 1, color: color.colorWithAlphaComponent(0.4))
        return path
    }
    
    
    private class func squares(color: UIColor) -> [UIPath] {
        var bezier2Path = UIBezierPath()
        bezier2Path.moveToPoint(CGPointMake(13.21, 13.21))
        bezier2Path.addLineToPoint(CGPointMake(13.21, 35.55))
        bezier2Path.addLineToPoint(CGPointMake(35.55, 35.55))
        bezier2Path.addLineToPoint(CGPointMake(35.55, 13.21))
        bezier2Path.addLineToPoint(CGPointMake(13.21, 13.21))
        bezier2Path.closePath()
        bezier2Path.moveToPoint(CGPointMake(31.83, 16.94))
        bezier2Path.addLineToPoint(CGPointMake(31.83, 31.83))
        bezier2Path.addLineToPoint(CGPointMake(16.94, 31.83))
        bezier2Path.addLineToPoint(CGPointMake(16.94, 16.94))
        bezier2Path.addLineToPoint(CGPointMake(31.83, 16.94))
        bezier2Path.closePath()
        bezier2Path.moveToPoint(CGPointMake(20.66, 20.66))
        bezier2Path.addLineToPoint(CGPointMake(20.66, 28.11))
        bezier2Path.addLineToPoint(CGPointMake(28.11, 28.11))
        bezier2Path.addLineToPoint(CGPointMake(28.11, 20.66))
        bezier2Path.addLineToPoint(CGPointMake(20.66, 20.66))
        bezier2Path.closePath()
        bezier2Path.moveToPoint(CGPointMake(5.77, 5.77))
        bezier2Path.addLineToPoint(CGPointMake(5.77, 43))
        bezier2Path.addLineToPoint(CGPointMake(43, 43))
        bezier2Path.addLineToPoint(CGPointMake(43, 5.77))
        bezier2Path.addLineToPoint(CGPointMake(5.77, 5.77))
        bezier2Path.closePath()
        bezier2Path.moveToPoint(CGPointMake(39.28, 39.28))
        bezier2Path.addLineToPoint(CGPointMake(9.49, 39.28))
        bezier2Path.addLineToPoint(CGPointMake(9.49, 9.49))
        bezier2Path.addLineToPoint(CGPointMake(39.28, 9.49))
        bezier2Path.addLineToPoint(CGPointMake(39.28, 39.28))
        bezier2Path.closePath()
        bezier2Path.miterLimit = 4;
        
        var path1: UIPath = UIPath(path: bezier2Path, lineWidth: 1, color: color.colorWithAlphaComponent(0.6))
        
        
        //// Bezier 4 Drawing
        var bezier4Path = UIBezierPath()
        bezier4Path.moveToPoint(CGPointMake(50.45, 13.21))
        bezier4Path.addLineToPoint(CGPointMake(50.45, 35.55))
        bezier4Path.addLineToPoint(CGPointMake(72.79, 35.55))
        bezier4Path.addLineToPoint(CGPointMake(72.79, 13.21))
        bezier4Path.addLineToPoint(CGPointMake(50.45, 13.21))
        bezier4Path.closePath()
        bezier4Path.moveToPoint(CGPointMake(69.06, 16.94))
        bezier4Path.addLineToPoint(CGPointMake(69.06, 31.83))
        bezier4Path.addLineToPoint(CGPointMake(54.17, 31.83))
        bezier4Path.addLineToPoint(CGPointMake(54.17, 16.94))
        bezier4Path.addLineToPoint(CGPointMake(69.06, 16.94))
        bezier4Path.closePath()
        bezier4Path.moveToPoint(CGPointMake(57.89, 20.66))
        bezier4Path.addLineToPoint(CGPointMake(57.89, 28.11))
        bezier4Path.addLineToPoint(CGPointMake(65.34, 28.11))
        bezier4Path.addLineToPoint(CGPointMake(65.34, 20.66))
        bezier4Path.addLineToPoint(CGPointMake(57.89, 20.66))
        bezier4Path.closePath()
        bezier4Path.moveToPoint(CGPointMake(43, 5.77))
        bezier4Path.addLineToPoint(CGPointMake(43, 43))
        bezier4Path.addLineToPoint(CGPointMake(80.23, 43))
        bezier4Path.addLineToPoint(CGPointMake(80.23, 5.77))
        bezier4Path.addLineToPoint(CGPointMake(43, 5.77))
        bezier4Path.closePath()
        bezier4Path.moveToPoint(CGPointMake(76.51, 39.28))
        bezier4Path.addLineToPoint(CGPointMake(46.72, 39.28))
        bezier4Path.addLineToPoint(CGPointMake(46.72, 9.49))
        bezier4Path.addLineToPoint(CGPointMake(76.51, 9.49))
        bezier4Path.addLineToPoint(CGPointMake(76.51, 39.28))
        bezier4Path.closePath()
        bezier4Path.miterLimit = 4;
        
        var path2: UIPath = UIPath(path: bezier4Path, lineWidth: 1, color: color.colorWithAlphaComponent(0.8))
        
        
        //// Bezier 6 Drawing
        var bezier6Path = UIBezierPath()
        bezier6Path.moveToPoint(CGPointMake(13.21, 50.45))
        bezier6Path.addLineToPoint(CGPointMake(13.21, 72.79))
        bezier6Path.addLineToPoint(CGPointMake(35.55, 72.79))
        bezier6Path.addLineToPoint(CGPointMake(35.55, 50.45))
        bezier6Path.addLineToPoint(CGPointMake(13.21, 50.45))
        bezier6Path.closePath()
        bezier6Path.moveToPoint(CGPointMake(31.83, 54.17))
        bezier6Path.addLineToPoint(CGPointMake(31.83, 69.06))
        bezier6Path.addLineToPoint(CGPointMake(16.94, 69.06))
        bezier6Path.addLineToPoint(CGPointMake(16.94, 54.17))
        bezier6Path.addLineToPoint(CGPointMake(31.83, 54.17))
        bezier6Path.closePath()
        bezier6Path.moveToPoint(CGPointMake(20.66, 57.89))
        bezier6Path.addLineToPoint(CGPointMake(20.66, 65.34))
        bezier6Path.addLineToPoint(CGPointMake(28.11, 65.34))
        bezier6Path.addLineToPoint(CGPointMake(28.11, 57.89))
        bezier6Path.addLineToPoint(CGPointMake(20.66, 57.89))
        bezier6Path.closePath()
        bezier6Path.moveToPoint(CGPointMake(5.77, 43))
        bezier6Path.addLineToPoint(CGPointMake(5.77, 80.23))
        bezier6Path.addLineToPoint(CGPointMake(43, 80.23))
        bezier6Path.addLineToPoint(CGPointMake(43, 43))
        bezier6Path.addLineToPoint(CGPointMake(5.77, 43))
        bezier6Path.closePath()
        bezier6Path.moveToPoint(CGPointMake(39.28, 76.51))
        bezier6Path.addLineToPoint(CGPointMake(9.49, 76.51))
        bezier6Path.addLineToPoint(CGPointMake(9.49, 46.72))
        bezier6Path.addLineToPoint(CGPointMake(39.28, 46.72))
        bezier6Path.addLineToPoint(CGPointMake(39.28, 76.51))
        bezier6Path.closePath()
        bezier6Path.miterLimit = 4;
        
        var path3: UIPath = UIPath(path: bezier6Path, lineWidth: 1, color: color.colorWithAlphaComponent(0.4))
        
        
        //// Bezier 8 Drawing
        var bezier8Path = UIBezierPath()
        bezier8Path.moveToPoint(CGPointMake(50.45, 50.45))
        bezier8Path.addLineToPoint(CGPointMake(50.45, 72.79))
        bezier8Path.addLineToPoint(CGPointMake(72.79, 72.79))
        bezier8Path.addLineToPoint(CGPointMake(72.79, 50.45))
        bezier8Path.addLineToPoint(CGPointMake(50.45, 50.45))
        bezier8Path.closePath()
        bezier8Path.moveToPoint(CGPointMake(69.06, 54.17))
        bezier8Path.addLineToPoint(CGPointMake(69.06, 69.06))
        bezier8Path.addLineToPoint(CGPointMake(54.17, 69.06))
        bezier8Path.addLineToPoint(CGPointMake(54.17, 54.17))
        bezier8Path.addLineToPoint(CGPointMake(69.06, 54.17))
        bezier8Path.closePath()
        bezier8Path.moveToPoint(CGPointMake(57.89, 57.89))
        bezier8Path.addLineToPoint(CGPointMake(57.89, 65.34))
        bezier8Path.addLineToPoint(CGPointMake(65.34, 65.34))
        bezier8Path.addLineToPoint(CGPointMake(65.34, 57.89))
        bezier8Path.addLineToPoint(CGPointMake(57.89, 57.89))
        bezier8Path.closePath()
        bezier8Path.moveToPoint(CGPointMake(43, 43))
        bezier8Path.addLineToPoint(CGPointMake(43, 80.23))
        bezier8Path.addLineToPoint(CGPointMake(80.23, 80.23))
        bezier8Path.addLineToPoint(CGPointMake(80.23, 43))
        bezier8Path.addLineToPoint(CGPointMake(43, 43))
        bezier8Path.closePath()
        bezier8Path.moveToPoint(CGPointMake(76.51, 76.51))
        bezier8Path.addLineToPoint(CGPointMake(46.72, 76.51))
        bezier8Path.addLineToPoint(CGPointMake(46.72, 46.72))
        bezier8Path.addLineToPoint(CGPointMake(76.51, 46.72))
        bezier8Path.addLineToPoint(CGPointMake(76.51, 76.51))
        bezier8Path.closePath()
        bezier8Path.miterLimit = 4;
        
        var path4: UIPath = UIPath(path: bezier8Path, lineWidth: 1, color: color.colorWithAlphaComponent(0.2))
        
        return [path1, path2, path3, path4]
    }
    
    func renderPatternToContext(context: CGContextRef) {
        if (!paths!.isEmpty) {
            for path in paths! {
                path.renderToContext(context)
            }
        }
    }
    
    func renderPatternGridToContext(context: CGContextRef, factor: Int) {
        for row in 0..<factor {
            for coloumn in 0..<factor {
                for p in paths! {
                    p.translatedPaths![row][coloumn].renderToContext(context)
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
    
    func setPatternColor(col: patternColor) {
        self.color = col
        for p in paths! {
            p.setColor(UIPattern.UIColorFromPatternColor(col))
        }
    }
}