
import UIKit
import QuartzCore

let TILESIZE : CGFloat = 40

class ViewController : UIViewController, UIGestureRecognizerDelegate, UIScrollViewDelegate {
    @IBOutlet var sv : UIScrollView!
    @IBOutlet var content : TiledView!
    @IBOutlet weak var phoneMask: UIImageView!
    var color = UIColor.redColor()
    
    @IBAction func handleButton(sender: AnyObject) {
        println("Yo")
        content.toggleColor()
    }
    
    override func viewDidLoad() {
        let f = CGRectMake(0,0,CGFloat(40)*TILESIZE,CGFloat(60)*TILESIZE)
        let contentView = TiledView(frame:f)
        let tsz = TILESIZE * contentView.layer.contentsScale
        (contentView.layer as CATiledLayer).tileSize = CGSizeMake(tsz, tsz)
        sv.addSubview(contentView)
        sv.contentSize = CGRectInfinite.size
        sv.delegate = self
        content = contentView
        sv.contentOffset = CGPoint(x: content.frame.size.width/2, y: content.frame.size.height/2)
        //phoneMask.maskView = content
        //content.maskView = phoneMask
    }
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer!, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer!) -> Bool {
        return true
    }
    
    func scrollViewDidEndZooming(scrollView: UIScrollView!, withView view: UIView!, atScale scale: CGFloat) {
        println(scale);
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return content
    }
    
    @IBAction func handleRotate(recognizer : UIRotationGestureRecognizer) {
        content.transform = CGAffineTransformRotate(content.transform, recognizer.rotation)
        recognizer.rotation = 0
    }
}

// there were low-memory problems with CATiledLayer in early versions of iOS 7
// but they seem to be gone now

class TiledView : UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor.clearColor()
    }
    
    override class func layerClass() -> AnyClass {
        return CATiledLayer.self
    }
    
    // not sure what this was supposed to do
    /*
    - (void)setContentScaleFactor:(CGFloat)contentScaleFactor
    {
    [super setContentScaleFactor:1.f];
    }
    */
    let red = UIColor(red: 0.885, green: 0.425, blue: 0.425, alpha: 1.000)
    let yellow = UIColor.yellowColor()
    var dotColor = UIColor(red: 0.885, green: 0.425, blue: 0.425, alpha: 1.000)
    var isRed = true
    
    func toggleColor() {
        if isRed {
            dotColor = yellow
        } else {
            dotColor = red
        }
        isRed = !isRed
        setNeedsDisplay()
    }
    
    // Using CoreGraphics
    override func drawRect(r: CGRect) {
        let x = Int(r.origin.x/TILESIZE)
        let y = Int(r.origin.y/TILESIZE)
        
        let context = UIGraphicsGetCurrentContext()
        
        //CGContextClearRect(context, CGRectMake(CGFloat(x)*TILESIZE, CGFloat(y)*TILESIZE, 20, 20));
        var ovalPath = UIBezierPath(ovalInRect: CGRectMake(CGFloat(x)*TILESIZE, CGFloat(y)*TILESIZE, 20, 20))
        dotColor.setFill()
        ovalPath.fill()
        
        CGContextFillPath(context)
        CGContextDrawPath(context, kCGPathFill)
    }
    
    /*
    override func drawRect(r: CGRect) {
        // println("drawRect: \(r)") // bug? not thread-safe! gives garbled output
        
        let tile = r
        let x = Int(tile.origin.x/TILESIZE)
        let y = Int(tile.origin.y/TILESIZE)
        NSLog("drawRect: %@", NSStringFromCGRect(r))

        //let tileName = NSString(format:"CuriousFrog_500_\(x+3)_\(y)")
        //let path = NSBundle.mainBundle().pathForResource(tileName, ofType:"png")
        //let image = UIImage(contentsOfFile:path)
        let image = UIImage(named:"greencircle")
        
        image.drawAtPoint(CGPointMake(CGFloat(x)*TILESIZE,CGFloat(y)*TILESIZE))
        
        // in real life, comment out the following! it's here just so we can see the tile boundaries
        
        //        let bp = UIBezierPath(rect: r)
        //        UIColor.whiteColor().setStroke()
        //        bp.stroke()
    }*/
}

