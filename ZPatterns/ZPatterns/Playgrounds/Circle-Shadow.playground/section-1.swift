// Playground - noun: a place where people can play

import UIKit

let canvas = UIView(frame: CGRectMake(0, 0, 200, 200))
let circle = UIView(frame: CGRectMake(50, 50, 100, 100))
circle.backgroundColor = UIColor.blueColor()
canvas.backgroundColor = UIColor(red: 0.7, green: 0.7, blue: 1.0, alpha: 1.0)

circle.layer.cornerRadius = circle.frame.size.width / 2

circle.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1.0).CGColor
circle.layer.shadowOpacity = 0.5
circle.layer.shadowOffset = CGSizeMake(0, 2)
circle.layer.shadowRadius = 4

//let shadowPath = UIBezierPath(roundedRect: circle.frame, cornerRadius: CGFloat(50)).CGPath
//circle.layer.shadowPath = shadowPath

canvas.addSubview(circle)
