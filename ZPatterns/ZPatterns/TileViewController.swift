//
//  ViewController.swift
//  ZPatterns
//
//  Created by Matt Appleby on 8/13/14.
//  Copyright (c) 2014 Zazzle. All rights reserved.
//

import UIKit
import QuartzCore

class TileViewController : UIViewController, UIGestureRecognizerDelegate, UIScrollViewDelegate {
    @IBOutlet var sv : InfiniteScrollView!
    @IBOutlet var content : TileView!
    @IBOutlet var invertedMask: UIImageView!

    
    let TILESIZE :CGFloat = 80
    
    override func viewDidLoad() {
        let f = CGRectMake(0,0,CGFloat(60)*TILESIZE, CGFloat(60)*TILESIZE)
        let contentView = TileView(frame:f, tilesize: TILESIZE)

        sv.addSubview(contentView)
        
        sv.contentSize = CGRectInfinite.size
        sv.delegate = self
        content = contentView
        
        sv.contentOffset = CGPoint(x: content.frame.size.width/2-sv.bounds.width/2 , y: content.frame.size.height/2-sv.bounds.height/2)
        
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer!, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer!) -> Bool {
        return true
    }
    
//    @IBAction func handlePinch(sender: UIPinchGestureRecognizer) {
//        content.transform = CGAffineTransformScale(content.transform, sender.scale, sender.scale)
//        sender.scale = 1
//    }
//
//    @IBAction func handleRotate(sender: UIRotationGestureRecognizer) {
//        if abs(sender.rotation) > 0.005 {
//            content.transform = CGAffineTransformRotate(content.transform, sender.rotation)
//        }
//        sender.rotation = 0
//    }
    
    func scrollViewDidEndZooming(scrollView: UIScrollView!, withView view: UIView!, atScale scale: CGFloat) {
        println(scale);
        content.setNeedsDisplay()
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return content
    }
    
    @IBOutlet var hue: UISlider!
    @IBAction func hueSliderChanged(sender: UISlider) {
        println("Hue: \(sender.value)")
        var currColor = content.pattern.color
        content.pattern.setPatternColor(UIPattern.patternColor(hue: CGFloat(sender.value), saturation: currColor.saturation, brightness: currColor.brightness))
        content.setNeedsDisplay()
    }
    
    @IBOutlet var saturation: UISlider!
    @IBAction func saturationSliderChanged(sender: UISlider) {
        println("Saturation: \(sender.value)")
        var currColor = content.pattern.color
        content.pattern.setPatternColor(UIPattern.patternColor(hue: currColor.hue, saturation: CGFloat(sender.value), brightness: currColor.brightness))
        content.setNeedsDisplay()
    }
    
    @IBOutlet var brightness: UISlider!
    @IBAction func brightnessSliderChanged(sender: UISlider) {
        println("Brightness: \(sender.value)")
        var currColor = content.pattern.color
        content.pattern.setPatternColor(UIPattern.patternColor(hue: currColor.hue, saturation: currColor.saturation, brightness: CGFloat(sender.value)))
        content.setNeedsDisplay()
    }
    
    
    
}

