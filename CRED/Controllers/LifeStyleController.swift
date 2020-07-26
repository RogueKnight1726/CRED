//
//  LifeStyleController.swift
//  CRED
//
//  Created by SWAT on 26/07/20.
//

import UIKit


class LifeStyleController: UIViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
    }
    
    
    func initViews(){
        
        let guide = view.safeAreaLayoutGuide
        
        let cardOne = GradientBaseView.init(with: [UIColor(red: 1.00, green: 0.96, blue: 0.96, alpha: 1.00).cgColor,UIColor(red: 0.96, green: 0.83, blue: 0.76, alpha: 1.00).cgColor], positions: [0,0.4,0.6,1], startAndEndPoints: [CGPoint.init(x: 0, y: 0),CGPoint.init(x: 1, y: 1)], circular: false, shadow: false, borderColor: nil, borderThickness: nil)
        view.addSubview(cardOne)
        cardOne.translatesAutoresizingMaskIntoConstraints = false
        [cardOne.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 8),
         cardOne.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -8),
         cardOne.topAnchor.constraint(equalTo: guide.topAnchor, constant: 16),
         cardOne.bottomAnchor.constraint(equalTo: guide.centerYAnchor, constant: -10)].forEach({$0.isActive = true})
        
    }
}
