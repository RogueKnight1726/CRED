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
    let imageView = UIImageView.init()
    
    
    convenience init(circular: Bool,borderColor: UIColor?,borderThickness: Int?){
        self.init()
        self.circular = circular
        self.borderThickness = CGFloat(borderThickness ?? 0)
        self.borderColor = borderColor?.cgColor
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        self.addSubview(imageView)
    }
    
    func setImage(image: UIImage){
        imageView.image = image
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
        self.bringSubviewToFront(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        [imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
         imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
         imageView.heightAnchor.constraint(equalToConstant: self.bounds.height - 30),
         imageView.widthAnchor.constraint(equalToConstant: self.bounds.height - 30)].forEach({$0.isActive = true})
        imageView.alpha = 0.3
        
    }
    
}
