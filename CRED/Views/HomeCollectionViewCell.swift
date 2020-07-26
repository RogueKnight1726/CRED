//
//  HomeCollectionViewCell.swift
//  CRED
//
//  Created by SWAT on 26/07/20.
//

import UIKit



class HomeCollectionViewCell: UICollectionViewCell{
    
    
    var item: BottomBarItems!{
        didSet{
            print("Model Recieved")
        }
    }
    var cardView: EmbossView!
    var containerView: BaseView!
    var userContent: BaseView!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        cardView = EmbossView.init(circular: false, borderColor: nil, borderThickness: nil)
        self.addSubview(cardView)
        containerView = BaseView.init(with: AppTheme.APP_BACKGROUNDCOLOR, circular: false, shadow: false, borderColor: nil, borderThickness: nil)
        self.addSubview(containerView)
        userContent = BaseView.init(with: UIColor(red: 0.31, green: 0.14, blue: 0.22, alpha: 1.00), circular: false, shadow: false, borderColor: nil, borderThickness: nil)
        self.addSubview(userContent)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        initViews()
    }
}



extension HomeCollectionViewCell{
    
    
    func initViews(){
        
        
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        [cardView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
         cardView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
         cardView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
         cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)].forEach({$0.isActive = true})
        containerView.translatesAutoresizingMaskIntoConstraints = false
        [containerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
         containerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
         containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
         containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)].forEach({$0.isActive = true})
        userContent.translatesAutoresizingMaskIntoConstraints = false
        [userContent.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 25),
         userContent.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -25),
         userContent.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
         userContent.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)].forEach({$0.isActive = true})
    }
}
