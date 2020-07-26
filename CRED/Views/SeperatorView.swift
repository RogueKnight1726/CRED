//
//  SeperatorView.swift
//  CRED
//
//  Created by SWAT on 26/07/20.
//

import UIKit


class SeperatorView: UIView{
    
    let gradient = CAGradientLayer()
    var shadowLayer = CAShapeLayer()
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
    }
    
    func setImage(image: UIImage){
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        if layer.sublayers?.contains(gradient) ?? false{
            gradient.removeFromSuperlayer()
        }
        gradient.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: 1)
        gradient.colors = [AppTheme.APP_BACKGROUNDCOLOR.cgColor,AppTheme.lighterShadowColor.cgColor,AppTheme.lighterShadowColor.cgColor,AppTheme.lighterShadowColor.cgColor,AppTheme.APP_BACKGROUNDCOLOR.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.locations = [0,0.3,0.5,0.7,1]
        self.layer.addSublayer(gradient)
        
        
        gradient.shadowColor = UIColor.black.cgColor
        gradient.shadowOpacity = 1.0
        gradient.shadowOffset = CGSize.init(width: 0, height: 4)
        gradient.shadowRadius = 6
        
    }
}
