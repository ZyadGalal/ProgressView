//
//  circularSolidProgressBar.swift
//  ProgressView
//
//  Created by ZyadGalal on 10/01/2021.
//

import UIKit


@IBDesignable

class GradientCircularProgressBar: UIView {
    @IBInspectable var barColor: UIColor? = .gray
    @IBInspectable var barRingwidth: CGFloat = 5
    
    @IBInspectable var animationColor: UIColor = .white {
        didSet{
            setNeedsDisplay()
        }
    }
    
    private let gradientLayer = CAGradientLayer()
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
        createAnimation()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        createAnimation()
    }
    func setup(){
        backgroundMask.lineWidth = barRingwidth
        backgroundMask.fillColor = nil
        backgroundMask.strokeColor = UIColor.black.cgColor
        layer.mask = backgroundMask

        progressLayer.lineWidth = barRingwidth
        progressLayer.fillColor = nil
        
        
        layer.addSublayer(gradientLayer)
        layer.transform = CATransform3DMakeRotation(CGFloat(90 * Double.pi / 180),0,0,-1)
        
        gradientLayer.mask = progressLayer
        gradientLayer.locations = [0.35 , 0.5 , 0.65]
        
    }
    private func createAnimation() {
        let startPointAnimation = CAKeyframeAnimation(keyPath: "startPoint")
        startPointAnimation.values = [CGPoint.zero, CGPoint(x: 1, y: 0), CGPoint(x: 1, y: 1)]

        startPointAnimation.repeatCount = Float.infinity
        startPointAnimation.duration = 1

        let endPointAnimation = CAKeyframeAnimation(keyPath: "endPoint")
        endPointAnimation.values = [CGPoint(x: 1, y: 1), CGPoint(x: 0, y: 1), CGPoint.zero]

        endPointAnimation.repeatCount = Float.infinity
        endPointAnimation.duration = 1

        gradientLayer.add(startPointAnimation, forKey: "startPointAnimation")
        gradientLayer.add(endPointAnimation, forKey: "endPointAnimation")
    }

    override func draw(_ rect: CGRect) {
        let circlePath = UIBezierPath(ovalIn: rect.insetBy(dx: barRingwidth / 2, dy: barRingwidth / 2))
        backgroundMask.path = circlePath.cgPath
        
        
        
        progressLayer.path = circlePath.cgPath
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd = progress
        progressLayer.lineCap = .round
        progressLayer.strokeColor = barColor?.cgColor
        
        gradientLayer.frame = rect
        gradientLayer.colors = [barColor?.cgColor , animationColor.cgColor , barColor?.cgColor]
        
    }
}
