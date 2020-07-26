//
//  CurvedEmbossView.swift
//  CRED
//
//  Created by SWAT on 26/07/20.
//

//
//  EmbossView.swift
//  CRED
//
//  Created by SWAT on 26/07/20.
//

import UIKit


class CurvedEmbossView: UIView{
    
    var roundedShape = CAShapeLayer()
    var curvedPath: UIBezierPath!
    var shapeColor: UIColor!
    var circular: Bool!
    var shadow: Bool!
    var borderColor: CGColor?
    var borderThickness: CGFloat?
    let gradient = CAGradientLayer()
    var topColor: UIColor?
    
    
    
    convenience init(circular: Bool,borderColor: UIColor?,borderThickness: Int?){
        self.init()
        self.circular = circular
        self.borderThickness = CGFloat(borderThickness ?? 0)
        self.borderColor = borderColor?.cgColor
    }
    
    convenience init(color: UIColor,circular: Bool,borderColor: UIColor?,borderThickness: Int?){
        self.init()
        self.circular = circular
        self.borderThickness = CGFloat(borderThickness ?? 0)
        self.borderColor = borderColor?.cgColor
        self.topColor = color
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
        gradient.colors = [AppTheme.embossLightColor.cgColor,AppTheme.embossLightColor.cgColor,AppTheme.embossDarkColor.cgColor,AppTheme.embossDarkColor.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.locations = [0,0.4,0.6,1]
        gradient.opacity = 0.5
        self.layer.addSublayer(gradient)
        
        let maskLayer = CAGradientLayer()
        maskLayer.frame = self.bounds
        maskLayer.shadowRadius = 5
        maskLayer.shadowPath = CGPath(roundedRect: self.bounds.insetBy(dx: 8, dy: 8), cornerWidth: self.circular ? (self.bounds.height - 4) / 2 : 10, cornerHeight: self.circular ? (self.bounds.height - 4) / 2 : 10, transform: nil)
        maskLayer.shadowOpacity = 1
        maskLayer.shadowOffset = CGSize.zero
        maskLayer.shadowColor = UIColor.white.cgColor
        gradient.mask = maskLayer
        
        
        if layer.sublayers?.contains(roundedShape) ?? false{
            roundedShape.removeFromSuperlayer()
        }
        
        let newView = UIView.init()
        self.addSubview(newView)
        newView.backgroundColor = topColor ?? UIColor(red: 0.13, green: 0.14, blue: 0.15, alpha: 1.00)
        newView.translatesAutoresizingMaskIntoConstraints = false
        [newView.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
         newView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0),
         newView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -30),
         newView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -30)].forEach({$0.isActive = true})
        newView.layer.cornerRadius = self.circular ? (self.bounds.height - 30) / 2 : 15
        newView.clipsToBounds = true
        
    }
}
