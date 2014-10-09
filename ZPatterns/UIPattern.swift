//
//  UIPattern.swift
//  ZPatterns
//
//  Created by Matt Appleby on 8/15/14.
//  Copyright (c) 2014 Zazzle. All rights reserved.
//

import Foundation
import UIKit

enum UIPatternType {
    case Chevron, Line
}

class UIPattern {
    var paths: [UIPath]
    var color: PatternColor
    
    // Initializes a pattern from the Patterns.swift class.
    init(type: UIPatternType) {
        color = PatternColor(hue: 1.0, saturation: 1.0, brightness: 1.0)
        switch (type) {
        case .Chevron:
            paths = Patterns.chevron(UIPattern.UIColorFromPatternColor(color))
        case .Line:
            paths = Patterns.line(UIPattern.UIColorFromPatternColor(color))
        }
    }
    
    // Struct used to store pattern color in hsb format because it is
    // hard to *get* the hsb values from a UIColor
    struct PatternColor {
        var hue: CGFloat
        var saturation: CGFloat
        var brightness: CGFloat
    }
    
    // Returns a UIColor from a PatternColor struct
    private class func UIColorFromPatternColor(col: PatternColor) -> UIColor {
        return UIColor(hue: col.hue, saturation: col.saturation, brightness: col.brightness, alpha: 1.0)
    }
    
    // Calls the renderToContext() method on all the paths in self.paths.
    func renderPatternToContext(context: CGContextRef) {
        if (!paths.isEmpty) {
            for path in paths {
                path.renderToContext(context)
            }
        }
    }
    
    // Calls the renderToContext() method on all the paths in each self.path.translatedPaths
    // within the specified factor.
    func renderPatternGridToContext(context: CGContextRef, factor: Int) {
        for row in 0..<factor {
            for column in 0..<factor {
                for path in paths {
                    path.translatedPaths![row][column].renderToContext(context)
                }
            }
        }
    }
    
    // Calls the generateTranslatedPath() method on all the paths in self.paths.
    func generateTranslatedPaths(tilesize: CGFloat, factor: Int) {
        if (!paths.isEmpty) {
            for p in paths {
                p.generateTranslatedPaths(tilesize, factor: factor)
            }
        }
    }
    
    // Sets the color of all the paths in self.paths. Still only works on the
    // zoomed in states.
    func setPatternColor(col: PatternColor) {
        self.color = col
        for p in paths {
            p.setColor(UIPattern.UIColorFromPatternColor(self.color))
        }
    }
}