//
//  InnerEmbossView.swift
//  CRED
//
//  Created by SWAT on 26/07/20.
//

import UIKit


class InnerEmbossView: UIView{
    
    var roundedShape = CAShapeLayer()
    var curvedPath: UIBezierPath!
    var shapeColor: UIColor!
    var circular: Bool!
    var shadow: Bool!
    var shadowLayer = CAShapeLayer()
    var borderColor: CGColor?
    var borderThickness: CGFloat?
    let gradient = CAGradientLayer()
    
    
    convenience init(circular: Bool,borderColor: UIColor?,borderThickness: Int?){
        self.init()
        self.circular = circular
        self.borderThickness = CGFloat(borderThickness ?? 0)
        self.borderColor = borderColor?.cgColor
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
    }
    
    
    func setColorToBaseView(color: UIColor){
        shapeColor = color
        layoutSubviews()
    }
    func setColors(color: UIColor,borderColor: UIColor){
        shapeColor = color
        self.borderColor = borderColor.cgColor
        layoutSubviews()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        if layer.sublayers?.contains(gradient) ?? false{
            gradient.removeFromSuperlayer()
        }
        curvedPath = UIBezierPath.init(roundedRect: self.bounds, cornerRadius: self.circular ? self.bounds.height / 2 : 15)
        roundedShape = CAShapeLayer()
        roundedShape.path = curvedPath.cgPath
        gradient.frame = self.bounds
        gradient.colors = [AppTheme.darkerShadowCOlor.cgColor,AppTheme.lighterShadowColor.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.locations = [0,1]
        self.layer.addSublayer(gradient)
        self.layer.mask = roundedShape
        
    }
    
}
