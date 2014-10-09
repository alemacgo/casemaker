//
//  TiledView.swift
//  ZPatterns
//
//  Created by Matt Appleby on 8/13/14.
//  Copyright (c) 2014 Zazzle. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore


class TileView : UIView {
    let TILESIZE: CGFloat
    var pattern: UIPattern
    
    init(frame: CGRect, tilesize: CGFloat) {
        TILESIZE = tilesize
        pattern = UIPattern(type: .Line)
        pattern.generateTranslatedPaths(tilesize, factor: 8)
        
        super.init(frame: frame)
        self.layer.contentsScale = 2
        let tsz = TILESIZE * self.layer.contentsScale
        (layer as CATiledLayer).tileSize = CGSizeMake(tsz, tsz)
        (layer as CATiledLayer).levelsOfDetailBias = 4
        (layer as CATiledLayer).levelsOfDetail = 8
    }

    // appeasing the compiler, don't use this initializer
    convenience override init() {
        self.init(frame: (CGRect(x: 0, y: 0, width: 80, height: 80)), tilesize: 40)
    }
    
    // appeasing the compiler, don't use this initializer
    required init(coder: NSCoder) {
        TILESIZE = 40
        pattern = UIPattern(type: .Chevron)
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor.clearColor()
    }
    
    override class func layerClass() -> AnyClass {
        return CATiledLayer.self
    }
    
    override func drawRect(r: CGRect) {
        let ctx: CGContextRef = UIGraphicsGetCurrentContext()
        let scale: CGFloat = CGContextGetCTM(ctx).a     // gets the current scale from the context
        
        let x = r.origin.x  // gets the origin coordinates of the current tile in the CATiledLayer
        let y = r.origin.y
        
        
        let size = max(r.width,r.height)
        
//        let info = "\(x)\t\t\(y)\t\t Scale: \(scale) \t\t Size: \(size)"
//        if(debug) { println(info) }

        // if we are zooming out
        if (scale <= 1) {
            var factor = (Int(size/TILESIZE))
//            if (debug) { println("Factor: \(factor)") }
            
            CGContextTranslateCTM(ctx, x, y)
            pattern.renderPatternGridToContext(ctx, factor: factor)
            
        }
            
        // if we are zooming in
        else {
            CGContextTranslateCTM(ctx, translateOrigin(x), translateOrigin(y))
            pattern.renderPatternToContext(ctx)
        }
        
       // Uncomment to see outlines around tiles in the CATiledLayer
//        UIColor.greenColor().set()
//        CGContextSetLineWidth(ctx, 6.0/scale)
//        var outline = CGRectMake(0,0, r.width, r.height)
//        CGContextStrokeRect(ctx, outline)
    }
    
    // Translates the origin to the maximum multiple of the Tilesize that is
    // still less than the i. For example if the tilesize is 80 and the given
    // i is 300 this will return 240.
    func translateOrigin(i: CGFloat) -> CGFloat {
        return i - i%TILESIZE
    }
    
    func changePattern(type: UIPatternType) {
        pattern = UIPattern(type: type)
        pattern.generateTranslatedPaths(TILESIZE, factor: 8)
    }
}