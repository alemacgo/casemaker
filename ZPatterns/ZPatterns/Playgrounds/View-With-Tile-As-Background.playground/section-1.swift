// Playground - noun: a place where people can play

import UIKit

let canvasWidth = CGFloat(300); let canvasHeight = CGFloat(200)
let viewWidth = CGFloat(100); let viewHeight = CGFloat(100)
let canvas = UIView(frame: CGRectMake(0, 0, canvasWidth, canvasHeight))
canvas.backgroundColor = UIColor.grayColor()

let view = UIView(frame: CGRectMake((canvasWidth - viewWidth)/2, (canvasHeight - viewHeight)/2, viewWidth, viewHeight))
view.backgroundColor = UIColor.blackColor()

// Code starts here
//let view2 = TileView()

canvas.addSubview(view)
