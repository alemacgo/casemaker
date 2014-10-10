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
    var color: UIColor
    
    // Initializes a pattern from the Patterns.swift class.
    init(type: UIPatternType, color: UIColor) {
        switch (type) {
            case .Chevron:
                paths = Patterns.chevron(color)
            case .Line:
                paths = Patterns.line(color)
        }
        self.color = color
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
    func setPatternColor(col: UIColor) {
        for p in paths {
            p.setColor(self.color)
        }
    }
}