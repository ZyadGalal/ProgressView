//
//  SolidHorizontalProgressBar.swift
//  ProgressView
//
//  Created by ZyadGalal on 10/01/2021.
//

import UIKit


@IBDesignable

class SolidHorizontalProgressView: UIView {
    
    @IBInspectable var barColor: UIColor = .gray {
        didSet{
            setNeedsDisplay()
        }
    }
    @IBInspectable var barCornerRadius: CGFloat = 0.25

    
    var progress: CGFloat = 0.3 {
        didSet{
            setNeedsDisplay()
        }
    }
    
    private let progressLayer = CALayer()
    private let backgroundMask = CAShapeLayer()

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    func setup() {
        layer.addSublayer(progressLayer)
        
    }
    
    override func draw(_ rect: CGRect) {
        backgroundMask.path = UIBezierPath(roundedRect: rect, cornerRadius: rect.height * barCornerRadius).cgPath
        layer.mask = backgroundMask

 
        let progressRect = CGRect(origin: .zero, size: CGSize(width: rect.width * progress , height: rect.height))
        progressLayer.frame = progressRect
        
        progressLayer.backgroundColor = barColor.cgColor

    }
    
}
