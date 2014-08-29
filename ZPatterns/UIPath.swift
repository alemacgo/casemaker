//
//  UIPath.swift
//  ZPatterns
//
//  Created by Matt Appleby on 8/15/14.
//  Copyright (c) 2014 Zazzle. All rights reserved.
//

import Foundation
import UIKit

class UIPath : NSObject {
    
    var path: UIBezierPath
    var color: UIColor
    var translatedPaths: Array<Array<UIPath>>?
    
    // constructor takes a UIBezierPath, line width, and color,
    init(path: UIBezierPath, color: UIColor) {
        self.path = path
        self.color = color
        super.init()
    }
    
    // appeasing the compiler
    convenience override init() {
        self.init(path: UIBezierPath(), color: UIColor.clearColor())
    }
    
    // sets the UIPath's UIBezierPath
    func setPath(newPath: UIBezierPath) {
        path = newPath
    }
    
    // Renders the path using the UIBezierPath's .setFill() and .fill() methods.
    // These methods render to the current UI Context so passing in the context here
    // is not really necessary. It is left over from when we were using CGPath objects
    // instead of UIBezierPaths
    func renderToContext(context: CGContextRef) {
        color.setFill()
        path.fill()
    }
    
    // Generates the array of paths that are used by the zoomed out states of the TileView.
    // When zoomed out to 0.5 zoom, each tile must consist of a 2x2 base pattern paths. When
    // zoomed out to 0.25 zoom, each tile in the TileView has 4x4 base pattern paths. And so on.
    // This method generates the array of translated paths to render to the graphics context. 
    // 
    // Params
    // tilesize: the size of the tiles in the TileView
    // factor: the number of zoomed out level for which this method should generate translated paths
    func generateTranslatedPaths(tilesize: CGFloat, factor: Int){
        var pathArray = Array(count: factor, repeatedValue: Array(count: factor, repeatedValue: UIPath()))
        let size = tilesize
        
        for r in 0..<factor {
            for c in 0..<factor {
                var translation = CGAffineTransformMakeTranslation(CGFloat(r)*size, CGFloat(c)*size)
                var newPath = CGPathCreateCopyByTransformingPath(self.path.CGPath, &translation)
                
                pathArray[r][c] = UIPath(path: UIBezierPath(CGPath: newPath), color: self.color)
            }
        }
        
        translatedPaths = pathArray
    }
    
    
    // Sets the color of the path. For now it only has an effect when zoomed in because it
    // does not recolor the paths in the translatedPaths array.
    func setColor(color: UIColor) {
        self.color = color
    }
}