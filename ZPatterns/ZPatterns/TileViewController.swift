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
    var content : TileView!

    let TILESIZE :CGFloat = 80
    var centerContentOffset: CGPoint!
    
    override func viewDidLoad() {
        let f = CGRectMake(0,0,CGFloat(100)*TILESIZE, CGFloat(100)*TILESIZE)
        let contentView = TileView(frame:f, tilesize: TILESIZE)

        sv.addSubview(contentView)
        sv.delegate = self
        content = contentView
        
        centerContentOffset = CGPoint(x: content.frame.size.width/2-sv.bounds.width/2 , y: content.frame.size.height/2-sv.bounds.height/2)
        sv.contentOffset = centerContentOffset
        
//        var panRecognizer = UIPanGestureRecognizer(target: self, action: "panDetected:")
//        self.view.addGestureRecognizer(panRecognizer)
        
        var pinchRecognizer = UIPinchGestureRecognizer(target: self, action: "pinchDetected:")
        self.view.addGestureRecognizer(pinchRecognizer)
        
        var rotationRecognizer = UIRotationGestureRecognizer(target: self, action: "rotationDetected:")
        self.view.addGestureRecognizer(rotationRecognizer)
        
        var tapRecognizer = UITapGestureRecognizer(target: self, action: "tapDetected:")
        tapRecognizer.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(tapRecognizer)
        
//        panRecognizer.delegate = self
        pinchRecognizer.delegate = self
        rotationRecognizer.delegate = self
    }
    
//    func panDetected(panRecognizer: UIPanGestureRecognizer) {
//        adjustAnchorPointForGestureRecognizer(panRecognizer)
//
//        
//        var translation: CGPoint = panRecognizer.translationInView(self.sv)
//        var tileViewPosition: CGPoint = self.content.center
//        var scale = (self.content.transform.a)
//        tileViewPosition.x += translation.x
//        tileViewPosition.y += translation.y
//        
//        self.content.center = tileViewPosition
//        panRecognizer.setTranslation(CGPointZero, inView: self.content)
//    }
    
    func pinchDetected(pinchRecognizer: UIPinchGestureRecognizer) {
        adjustAnchorPointForGestureRecognizer(pinchRecognizer)

        var scale: CGFloat = pinchRecognizer.scale
        self.content.transform = CGAffineTransformScale(self.content.transform, scale, scale)
        pinchRecognizer.scale = 1.0
    }
    
    func adjustAnchorPointForGestureRecognizer(gestureRecognizer: UIGestureRecognizer) {
        if (gestureRecognizer.state == UIGestureRecognizerState.Began) {
            var view = content
            var locationInView = gestureRecognizer.locationInView(view)
            var locationInSuperview = gestureRecognizer.locationInView(view.superview)
            view.layer.anchorPoint = CGPointMake(locationInView.x / view.bounds.size.width, locationInView.y / view.bounds.size.height)
            view.center = locationInSuperview
        }
    }
    
    func rotationDetected(rotationRecognizer: UIRotationGestureRecognizer) {
        adjustAnchorPointForGestureRecognizer(rotationRecognizer)
        
        var angle: CGFloat = rotationRecognizer.rotation
        self.content.transform = CGAffineTransformRotate(self.content.transform, angle)
        var point: CGPoint = rotationRecognizer.locationOfTouch(0, inView: sv)
        rotationRecognizer.rotation = 0.0
    }
    
    func radiansToDegrees (radians: Float) -> Float {
        return radians * Float(180.0)/Float(M_PI)
    }
    
    func tapDetected(tapRecognizer: UITapGestureRecognizer) {
//        var t: CGAffineTransform = self.content.transform
//        var currentRotationAngleInRadians: Float = atan2f(Float(t.b), Float(t.a))
//        
//        let lockDegreeInRadians: Float = radiansToDegrees(Float(45.0))
//        
//        var nearestMultipleOfLockDegree = currentRotationAngleInRadians/lockDegreeInRadians
//        var multipleRemainder = currentRotationAngleInRadians % lockDegreeInRadians
//        
//        if (multipleRemainder > lockDegreeInRadians/2) {
//            nearestMultipleOfLockDegree++
//        }
//        
//        let angle = nearestMultipleOfLockDegree * lockDegreeInRadians
        
        UIView.animateWithDuration(0.4, animations: {
//            self.sv.contentOffset = self.centerContentOffset
//            self.content.transform = CGAffineTransformRotate(self.content.transform, CGFloat(angle))
            self.content.transform = CGAffineTransformIdentity
        })
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
    
//    
//    func scrollViewDidEndZooming(scrollView: UIScrollView!, withView view: UIView!, atScale scale: CGFloat) {
//        println(scale);
//        content.setNeedsDisplay()
//    }
//    
//    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
//        return content
//    }
    
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

