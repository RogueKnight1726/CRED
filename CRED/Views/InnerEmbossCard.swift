//
//  InnerEmbossCard.swift
//  CRED
//
//  Created by SWAT on 26/07/20.
//

import UIKit


class InnerEmbossCard: UIView{
    
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
        self.layer.insertSublayer(gradient, at: 0)
        self.layer.mask = roundedShape
        roundedShape.shadowPath = curvedPath.cgPath
        roundedShape.shadowOffset = CGSize.init(width: 1, height: 1)
        roundedShape.shadowRadius = 10
        roundedShape.shadowColor = UIColor.white.cgColor
        
        addInnerShadow()
        
    }
    
    func addInnerShadow()
    {
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath.init(roundedRect: self.bounds, cornerRadius: self.circular ? self.bounds.height / 2 : 15)
        let innerPath = UIBezierPath(roundedRect: CGRect(x: -1, y: -1, width: self.frame.width + 1, height: self.frame.height + 1), cornerRadius: self.circular ? self.bounds.height / 2 : 15)
        path.append(innerPath.reversing())
        shapeLayer.path = path.cgPath
        self.layer.addSublayer(shapeLayer)
        shapeLayer.shadowOpacity = 1.0
        shapeLayer.shadowColor = UIColor.black.cgColor
        shapeLayer.shadowOffset = CGSize(width: 1, height: 1)
        shapeLayer.shadowRadius = 6
        
        
        let lighterShape = CAShapeLayer()
        let lighterPath = UIBezierPath.init(roundedRect: self.bounds, cornerRadius: self.circular ? self.bounds.height / 2 : 15)
        let innerLightPath = UIBezierPath(roundedRect: CGRect(x: -1, y: -1, width: self.frame.width, height: self.frame.height), cornerRadius: self.circular ? self.bounds.height / 2 : 15)
        innerLightPath.append(lighterPath.reversing())
        lighterShape.path = innerLightPath.cgPath
        lighterShape.fillColor = AppTheme.embossLightColor.cgColor
        self.layer.addSublayer(lighterShape)
        lighterShape.shadowOpacity = 1.0
        lighterShape.shadowColor = UIColor.black.cgColor
        lighterShape.shadowOffset = CGSize(width: 1, height: 1)
        lighterShape.shadowRadius = 6
    }
}
