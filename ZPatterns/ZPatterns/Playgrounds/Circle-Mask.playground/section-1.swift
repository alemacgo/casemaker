// Playground - noun: a place where people can play

import UIKit

let canvas = UIView(frame: CGRectMake(0, 0, 200, 200))
let circle = UIView(frame: CGRectMake(50, 50, 100, 100))
circle.backgroundColor = UIColor.blueColor()
canvas.backgroundColor = UIColor(red: 0.7, green: 0.7, blue: 1.0, alpha: 1.0)

let shape = CAShapeLayer()
shape.frame = circle.bounds
let pathRef = CGPathCreateWithEllipseInRect(circle.bounds, nil)
shape.path = pathRef
circle.layer.mask = shape

//circle.layer.mask.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0).CGColor
//circle.layer.mask.shadowOffset = CGSizeMake(0, 2)



canvas.addSubview(circle)


