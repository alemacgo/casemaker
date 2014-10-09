// Playground - noun: a place where people can play

import UIKit

// First, we create a canvas
let canvasWidth = CGFloat(300); let canvasHeight = CGFloat(200)
let viewWidth = CGFloat(100); let viewHeight = CGFloat(100)
let canvas = UIView(frame: CGRectMake(0, 0, canvasWidth, canvasHeight))
canvas.backgroundColor = UIColor.grayColor()

// Then, we create an object and center it inside the canvas
let view = UIView(frame: CGRectMake((canvasWidth - viewWidth)/2, (canvasHeight - viewHeight)/2, viewWidth, viewHeight))
view.backgroundColor = UIColor.blackColor()

// Let's see how it looks!
canvas.addSubview(view)
