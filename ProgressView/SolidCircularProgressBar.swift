//
//  circularSolidProgressBar.swift
//  ProgressView
//
//  Created by ZyadGalal on 10/01/2021.
//

import UIKit


@IBDesignable

class SolidCircularProgressBar: UIView {
    @IBInspectable var barColor: UIColor? = .gray
    @IBInspectable var barRingwidth: CGFloat = 5
    
    private let progressLayer = CAShapeLayer()
    private let backgroundMask = CAShapeLayer()
    var progress: CGFloat = 0.3 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    func setup(){
        backgroundMask.lineWidth = barRingwidth
        backgroundMask.fillColor = nil
        backgroundMask.strokeColor = UIColor.black.cgColor
        layer.mask = backgroundMask

        progressLayer.lineWidth = barRingwidth
        progressLayer.fillColor = nil
        layer.addSublayer(progressLayer)
        layer.transform = CATransform3DMakeRotation(CGFloat(90 * Double.pi / 180),0,0,-1)
    }
    override func draw(_ rect: CGRect) {
        let circlePath = UIBezierPath(ovalIn: rect.insetBy(dx: barRingwidth / 2, dy: barRingwidth / 2))
        backgroundMask.path = circlePath.cgPath
        
        
        
        progressLayer.path = circlePath.cgPath
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd = progress
        progressLayer.lineCap = .round
        progressLayer.strokeColor = barColor?.cgColor
        
  
        
    }
}
