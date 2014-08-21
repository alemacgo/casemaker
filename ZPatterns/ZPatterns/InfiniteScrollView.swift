//
//  InfiniteScrollView.swift
//  ZPatterns
//
//  Created by Matt Appleby on 8/20/14.
//  Copyright (c) 2014 Zazzle. All rights reserved.
//

import Foundation

class InfiniteScrollView : UIScrollView {
    override init() {
        super.init()
        self.contentSize = CGSizeMake(4800, 4800)
        println("init1")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        println("init2")

    }
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        println("init3")
        self.contentSize = CGSizeMake(4800, 4800)
    }
    
    func recenterIfNecessary() {
        var currentOffset = self.contentOffset
        var contentWidth = self.contentSize.width
        var contentHeight = self.contentSize.height
        var centerOffsetX = (contentWidth - self.bounds.size.width)/2.0
        var centerOffsetY = (contentHeight - self.bounds.size.height)/2.0
        var XdistanceFromCenter = fabs(currentOffset.x - centerOffsetX)
        var YdistanceFromCenter = fabs(currentOffset.y - centerOffsetY)
        
        if (XdistanceFromCenter > (contentWidth/4)) {
            self.contentOffset = CGPointMake(centerOffsetX, currentOffset.y)
            
            // move content here
        }
        
        if (YdistanceFromCenter > (contentWidth/4)) {
            self.contentOffset = CGPointMake(currentOffset.x, centerOffsetY)
            
            // move content here
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        recenterIfNecessary()
    }
}
