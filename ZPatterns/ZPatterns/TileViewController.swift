//
//  ViewController.swift
//  ZPatterns
//
//  Created by Matt Appleby on 8/13/14.
//  Copyright (c) 2014 Zazzle. All rights reserved.
//

import UIKit
import QuartzCore

let topRowY:CGFloat = 455
let bottomRowY:CGFloat = 511
let buttonXSpacing:CGFloat = 63
let buttonSize:CGFloat = 44

let color1 = UIColor(hue:0.303, saturation:0.259, brightness:0.910, alpha:1.0)
let color2 = UIColor(hue:0.140, saturation:0.267, brightness:1.0, alpha:1.0)
let color3 = UIColor(hue:0.097, saturation:0.651, brightness:1.0, alpha:1.0)
let color4 = UIColor(hue:0.051, saturation:0.424, brightness:1.0, alpha:1.0)

class TileViewController : UIViewController, UIGestureRecognizerDelegate, UIScrollViewDelegate {
    @IBOutlet var sv : InfiniteScrollView!
    var content : TileView!

    let TILESIZE :CGFloat = 80
    var centerContentOffset: CGPoint!
    
    @IBOutlet weak var chevronButton: UIButton!
    @IBOutlet weak var lineButton: UIButton!
    
    @IBOutlet weak var colorButton: CircleButton!
    var colorButtons:[CircleButton] = []
    
    func addColorButton(x: CGFloat, _ color: UIColor) {
        let newButton = CircleButton(frame: CGRectMake(x, topRowY, buttonSize, buttonSize), color)
        newButton.addTarget(self, action:"setColor:", forControlEvents:.TouchUpInside)
        colorButtons.append(newButton)
        self.view.addSubview(newButton)
    }
    
    func setColor(button:UIButton) {
        content.changeColor(button.backgroundColor!)
        let tempColor = colorButton.backgroundColor
        colorButton.backgroundColor = button.backgroundColor
        button.backgroundColor = tempColor
        self.content.setNeedsDisplay()
    }
    
    func addButtons() {
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: nil, animations: {
            self.colorButton.center.y -= (bottomRowY - topRowY)
            }, { (completed) -> Void in
                //animate with duration + opacity here
                // Add two buttons to the left
                self.addColorButton(self.colorButton.center.x - buttonSize/2 - buttonXSpacing, color1)
                self.addColorButton(self.colorButton.center.x - buttonSize/2 - 2 * buttonXSpacing, color2)
                
                // Add two buttons to the right
                self.addColorButton(self.colorButton.center.x - buttonSize/2 + buttonXSpacing, color3)
                self.addColorButton(self.colorButton.center.x - buttonSize/2 + 2 * buttonXSpacing, color4)
                //addColorButton(colorButton.center.x + buttonSize/2 + 2 * buttonXSpacing)
        })
    }
    
    
    @IBAction func colorButtonDidTap(sender: UIButton) {
        // The tag is used as a status. If the button
        // hasn't been pressed, the tag is 0 and the
        // color buttons are added to the view.
        // If it has, the tag is 1 and the color buttons
        // are removed from the view.
        if (sender.tag == 0) {
            addButtons()
            sender.tag = 1
        }
        else {
            UIView.animateWithDuration(0.3, delay: 0,
            usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8, options: nil, animations: {
                self.colorButton.center.y += (bottomRowY - topRowY)
            }, {(completed) -> Void in
                for button in self.colorButtons {
                    button.removeFromSuperview()
                }
                self.colorButtons = []
                sender.tag = 0
            })
        }
    }
    
    var color = UIColor(hue: 1.0, saturation: 0.5, brightness: 1.0, alpha: 1.0)
    
    override func viewDidLoad() {
        let f = CGRectMake(0,0,CGFloat(100)*TILESIZE, CGFloat(100)*TILESIZE)
        let MyTileView = TileView(frame:f, tilesize: TILESIZE, color: color)
        
        sv.addSubview(MyTileView)   // adds the TileView to the scrollview
        sv.delegate = self          // sets the scrollview's delegate to this controller
        content = MyTileView        // sets the instance variable content to the MyTileView
        
        // center the TileView in the scrollview
        centerContentOffset = CGPoint(x: content.frame.size.width/2-sv.bounds.width/2 , y: content.frame.size.height/2-sv.bounds.height/2)
        sv.contentOffset = centerContentOffset
        
        // ** Custom Gesture Recognizers implemented programatically **
        
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
    
    
    // Rounds to the nearest multiple of param:multiple. There is still a problem with
    // this method in that it does not account for the way in which iOS and CGAffineTransforms
    // work. Rotations to the right go from 0 to pi and to the left go from 0 to -pi. So in a
    // few situations, the angle to lock to does is not actually the closest multiple.
    func round(num: CGFloat, multiple: CGFloat) -> CGFloat {
        var temp: CGFloat = num % multiple
        if (fabs(temp) < fabs(multiple / 2)) {
            return num - temp
        } else {
            return num + multiple - temp
        }
    }
    
    func tapDetected(tapRecognizer: UITapGestureRecognizer) {
//        var radian:CGFloat = (content.valueForKeyPath("layer.transform.rotation.z") as CGFloat)
//
//        println("Radians: \(radian/CGFloat(M_PI))pi")
//        println("Degrees: \(radiansToDegrees(Float(radian)))")
//
//        let lockAngle: CGFloat = CGFloat(M_PI_4)
//        var newAngle = round(radian, multiple: lockAngle)
//        
//        var angle = newAngle - radian     // gets the angle to rotate by subtracting the original angle from the desired angle
        
        UIView.animateWithDuration(0.4, animations: {
//            self.sv.contentOffset = self.centerContentOffset
//            self.content.transform = CGAffineTransformIdentity
            self.content.transform = CGAffineTransformRotate(self.content.transform, CGFloat(M_PI))
        })
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer!, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer!) -> Bool {
        return true
    }

    @IBAction func patternButtonDidTap() {
        chevronButton.hidden = false
        lineButton.hidden = false
    }
    
    @IBAction func linePatternButtonDidTap() {
        self.content.changePattern(.Line)
        self.content.setNeedsDisplay()
        chevronButton.hidden = true
        lineButton.hidden = true
    }
    
    @IBAction func chevronPatternButtonDidTap() {
        //self.content.pattern = UIPattern(type: .Chevron)
        //self.content.pattern.setPattern(.Chevron)
        self.content.changePattern(.Chevron)
        self.content.setNeedsDisplay()
        chevronButton.hidden = true
        lineButton.hidden = true
    }
    
//    @IBAction func handleRotate(sender: UIRotationGestureRecognizer) {
//        if abs(sender.rotation) > 0.005 {
//            content.transform = CGAffineTransformRotate(content.transform, sender.rotation)
//        }
//        sender.rotation = 0
//    }
    
//    func scrollViewDidEndZooming(scrollView: UIScrollView!, withView view: UIView!, atScale scale: CGFloat) {
//        println(scale);
//        content.setNeedsDisplay()
//    }
//    
//    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
//        return content
//    }
    
}

