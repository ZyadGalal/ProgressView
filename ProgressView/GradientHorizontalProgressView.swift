//
//  GradientHorizontalProgressView.swift
//  ProgressView
//
//  Created by ZyadGalal on 10/01/2021.
//

import UIKit

@IBDesignable

class GradientHorizontalProgressView: UIView {
    
    @IBInspectable var barColor: UIColor = .gray {
        didSet{
            setNeedsDisplay()
        }
    }
    @IBInspectable var barCornerRadius: CGFloat = 0.25
    @IBInspectable var animationColor: UIColor = .white {
        didSet{
            setNeedsDisplay()
        }
    }
    
    var progress: CGFloat = 0.3 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    private let progressLayer = CALayer()
    private let backgroundMask = CAShapeLayer()
    private let gradientLayer = CAGradientLayer()
    

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        animateProgressView()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        animateProgressView()
    }
    func setup() {
        layer.addSublayer(gradientLayer)
        gradientLayer.mask = progressLayer
        gradientLayer.locations = [0.3, 0.5, 0.65]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        
    }
    
    private func animateProgressView(){
        let flowAnimatoin = CABasicAnimation(keyPath: "locations")
        flowAnimatoin.fromValue = [-0.3 , -0.15 , 0]
        flowAnimatoin.toValue = [1 , 1.15 , 1.3]
        flowAnimatoin.isRemovedOnCompletion = false
        flowAnimatoin.repeatCount = .infinity
        flowAnimatoin.duration = 1
        
        gradientLayer.add(flowAnimatoin, forKey: "flowAnimation")
    }
    override func draw(_ rect: CGRect) {
        backgroundMask.path = UIBezierPath(roundedRect: rect, cornerRadius: rect.height * barCornerRadius).cgPath
        layer.mask = backgroundMask

 
        let progressRect = CGRect(origin: .zero, size: CGSize(width: rect.width * progress , height: rect.height))
        progressLayer.frame = progressRect
        
        progressLayer.backgroundColor = UIColor.black.cgColor
        
        gradientLayer.frame = rect
        gradientLayer.colors = [barColor.cgColor , animationColor.cgColor , barColor.cgColor]
        gradientLayer.endPoint = CGPoint(x: progress, y: 0.5)

    }
}
