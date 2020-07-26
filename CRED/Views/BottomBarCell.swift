//
//  BottomBarCell.swift
//  CRED
//
//  Created by SWAT on 26/07/20.
//

import UIKit

class BottomBarCell: UICollectionViewCell{
    
    var icon: UIImageView!
    var descriptionLabel: UILabel!
    var item: BottomBarItems!{
        didSet{
            print("Model Recieved")
        }
    }
    var cardView: EmbossView!
    
    override var isSelected: Bool{
        didSet{
            UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
                self.cardView.alpha = self.isSelected ? 1 : 0
                self.descriptionLabel.textColor = self.isSelected ? AppTheme.selectedColor : AppTheme.deSelectedColor
            }, completion: nil)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        cardView = EmbossView.init(circular: false, borderColor: nil, borderThickness: nil)
        cardView.alpha = 0
        self.addSubview(cardView)
        
        icon = UIImageView()
        self.addSubview(icon)
        descriptionLabel = UILabel()
        self.addSubview(descriptionLabel)
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        initViews()
    }
}



extension BottomBarCell{
    
    
    func initViews(){
        
        
        
        
        
        
        
        cardView.translatesAutoresizingMaskIntoConstraints = false
        [cardView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
         cardView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
         cardView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
         cardView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)].forEach({$0.isActive = true})
        
        
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        [descriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 10),
         descriptionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0)].forEach({$0.isActive = true})
        var descriptiontext = ""
        switch item{
            case .Home:
                descriptiontext = "home"
            case .Cards:
                descriptiontext = "cards"
            case .LifeStyle:
                descriptiontext = "lifestyle"
            default:
                break
        }
        descriptionLabel.text = descriptiontext
        descriptionLabel.font = UIFont.systemFont(ofSize: 13, weight: .light)
        descriptionLabel.textColor = AppTheme.deSelectedColor
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        [icon.heightAnchor.constraint(equalToConstant: 20),
         icon.widthAnchor.constraint(equalToConstant: 20),
         icon.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0),
         icon.rightAnchor.constraint(equalTo: descriptionLabel.leftAnchor, constant: -10)].forEach({$0.isActive = true})
        icon.contentMode = .scaleAspectFit
        icon.image = UIImage.init(named: item.rawValue)
    }
}
