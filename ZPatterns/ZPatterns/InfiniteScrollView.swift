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
        self.contentSize = CGSizeMake(5000, 568)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required convenience init(coder aDecoder: NSCoder!) {
        self.init()
    }
    
    func recenterIfNecessary() {
        var currentOffset = self.contentOffset
        var contentWidth = self.contentSize.width
        var centerOffsetX = (contentWidth - self.bounds.size.width)/2.0
        var distanceFromCenter = fabs(currentOffset.x - centerOffsetX)
        
        if (distanceFromCenter > (contentWidth/4)) {
            self.contentOffset = CGPointMake(centerOffsetX, currentOffset.y)
            
            // move content here
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        recenterIfNecessary()
    }
}
