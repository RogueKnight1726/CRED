//
//  GradientBaseView.swift
//  CRED
//
//  Created by SWAT on 26/07/20.
//

import UIKit

class GradientBaseView: UIView{
    
    
    
    var roundedShape = CAShapeLayer()
    var curvedPath: UIBezierPath!
    var circular: Bool!
    var shadow: Bool!
    var shadowLayer = CAShapeLayer()
    var borderColor: CGColor?
    var borderThickness: CGFloat?
    let gradient = CAGradientLayer()
    var colorArray: [CGColor]!
    var colorPositions: [NSNumber]!
    var startPointToEndPoint: [CGPoint]?
    
    
    convenience init(with colors: [CGColor],positions: [NSNumber],startAndEndPoints: [CGPoint], circular: Bool, shadow: Bool,borderColor: UIColor?,borderThickness: Int?){
        self.init()
        self.circular = circular
        self.shadow = shadow
        self.borderThickness = CGFloat(borderThickness ?? 0)
        self.borderColor = borderColor?.cgColor
        self.colorArray = colors
        self.colorPositions = positions
        self.startPointToEndPoint = startAndEndPoints
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        curvedPath = UIBezierPath.init(roundedRect: self.bounds, cornerRadius: self.circular ? self.bounds.height / 2 : 15)
        roundedShape = CAShapeLayer()
        roundedShape.path = curvedPath.cgPath
        
        if layer.sublayers?.contains(gradient) ?? false{
            gradient.removeFromSuperlayer()
        }
        
        
        gradient.frame = self.bounds
        gradient.colors = colorArray
        gradient.startPoint = startPointToEndPoint?[0] ?? CGPoint(x: 0, y: 0)
        gradient.endPoint = startPointToEndPoint?[1] ?? CGPoint(x: 1, y: 1)
        gradient.locations = colorPositions
        gradient.mask = roundedShape
        self.layer.addSublayer(gradient)
    }
    
    
}
