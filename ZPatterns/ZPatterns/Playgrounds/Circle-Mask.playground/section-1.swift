// Playground - noun: a place where people can play

import UIKit

let canvas = UIView(frame: CGRectMake(0, 0, 200, 200))
let circle = UIView(frame: CGRectMake(100, 100, 50, 50))
circle.backgroundColor = UIColor.blueColor()
canvas.backgroundColor = UIColor(red: 0.7, green: 0.7, blue: 1.0, alpha: 1.0)

let shape = CAShapeLayer()
shape.frame = circle.bounds
let pathRef = CGPathCreateWithEllipseInRect(circle.bounds, nil)
shape.path = pathRef
circle.layer.mask = shape

canvas.addSubview(circle)