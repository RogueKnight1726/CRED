//
//  CardsController.swift
//  CRED
//
//  Created by SWAT on 26/07/20.
//

import UIKit


class CardsController: UIViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
    }
    
    func initViews(){
        let guide = self.view.safeAreaLayoutGuide
        view.backgroundColor = AppTheme.APP_BACKGROUNDCOLOR
        
        let cardsHeadinglabel = UILabel()
        view.addSubview(cardsHeadinglabel)
        cardsHeadinglabel.translatesAutoresizingMaskIntoConstraints = false
        [cardsHeadinglabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 28),
         cardsHeadinglabel.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 16)].forEach({$0.isActive = true})
        cardsHeadinglabel.text = "cards"
        cardsHeadinglabel.textColor = AppTheme.cardsControllertextColor
        cardsHeadinglabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        
        let addNewCardEmbossView = CurvedEmbossView.init(circular: true, borderColor: nil, borderThickness: nil)
        view.addSubview(addNewCardEmbossView)
        addNewCardEmbossView.translatesAutoresizingMaskIntoConstraints = false
        [addNewCardEmbossView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
         addNewCardEmbossView.centerYAnchor.constraint(equalTo: cardsHeadinglabel.centerYAnchor, constant: 0),
         addNewCardEmbossView.heightAnchor.constraint(equalToConstant: 90),
         addNewCardEmbossView.widthAnchor.constraint(equalToConstant: 190)].forEach({$0.isActive = true})
        
        let plusButton = InnerEmbossView.init(circular: true, borderColor: nil, borderThickness: nil)
        view.addSubview(plusButton)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        [plusButton.leftAnchor.constraint(equalTo: addNewCardEmbossView.leftAnchor, constant: 20),
         plusButton.centerYAnchor.constraint(equalTo: addNewCardEmbossView.centerYAnchor, constant: 0),
         plusButton.heightAnchor.constraint(equalToConstant: 50),
         plusButton.widthAnchor.constraint(equalToConstant: 50)].forEach({$0.isActive = true})
        plusButton.setImage(image: UIImage.init(named: "addIcon")!)
        
        let addNewLabel = UILabel()
        view.addSubview(addNewLabel)
        addNewLabel.translatesAutoresizingMaskIntoConstraints = false
        [addNewLabel.centerYAnchor.constraint(equalTo: plusButton.centerYAnchor, constant: 0),
         addNewLabel.leftAnchor.constraint(equalTo: plusButton.rightAnchor, constant: 16)].forEach({$0.isActive = true})
        addNewLabel.text = "Add new"
        addNewLabel.textColor = AppTheme.cardsControllertextColor
        addNewLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        let seperatorOne = SeperatorView.init()
        view.addSubview(seperatorOne)
        seperatorOne.translatesAutoresizingMaskIntoConstraints = false
        [seperatorOne.topAnchor.constraint(equalTo: addNewCardEmbossView.bottomAnchor, constant: 20),
         seperatorOne.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
         seperatorOne.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0),
         seperatorOne.heightAnchor.constraint(equalToConstant: 2)].forEach({$0.isActive = true})
        
        
        
        
        
        let creditCardContainerView = InnerEmbossCard.init(circular: false, borderColor: nil, borderThickness: nil)
        view.addSubview(creditCardContainerView)
        creditCardContainerView.translatesAutoresizingMaskIntoConstraints = false
        [creditCardContainerView.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 16),
         creditCardContainerView.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -16),
         creditCardContainerView.topAnchor.constraint(equalTo: seperatorOne.bottomAnchor, constant: 20),
         creditCardContainerView.heightAnchor.constraint(equalToConstant: 360)].forEach({$0.isActive = true})
        
        let creditCard = BaseImageView.init(with: .white, circular: false, shadow: false, borderColor: nil, borderThickness: nil)
        view.addSubview(creditCard)
        creditCard.translatesAutoresizingMaskIntoConstraints = false
        [creditCard.leftAnchor.constraint(equalTo: creditCardContainerView.leftAnchor, constant: 8),
         creditCard.rightAnchor.constraint(equalTo: creditCardContainerView.rightAnchor, constant: -8),
         creditCard.topAnchor.constraint(equalTo: creditCardContainerView.topAnchor, constant: 8),
         creditCard.heightAnchor.constraint(equalToConstant: 240)].forEach({$0.isActive = true})
        creditCard.image = UIImage.init(named: "avatar")
        
        let totalDueDescriprionLabel = UILabel()
        view.addSubview(totalDueDescriprionLabel)
        totalDueDescriprionLabel.translatesAutoresizingMaskIntoConstraints = false
        [totalDueDescriprionLabel.leftAnchor.constraint(equalTo: creditCard.leftAnchor, constant: 8),
         totalDueDescriprionLabel.topAnchor.constraint(equalTo: creditCard.bottomAnchor, constant: 16)].forEach({$0.isActive = true})
        totalDueDescriprionLabel.text = "total due"
        totalDueDescriprionLabel.textColor = AppTheme.embossLightColor
        totalDueDescriprionLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        
        let dueAmountLabel = UILabel()
        view.addSubview(dueAmountLabel)
        dueAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        [dueAmountLabel.leftAnchor.constraint(equalTo: creditCard.leftAnchor, constant: 8),
         dueAmountLabel.topAnchor.constraint(equalTo: totalDueDescriprionLabel.bottomAnchor, constant: 8)].forEach({$0.isActive = true})
        dueAmountLabel.text = "₹59,000.00"
        dueAmountLabel.textColor = AppTheme.cardsControllertextColor
        dueAmountLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        
        let dueInLabel = UILabel()
        view.addSubview(dueInLabel)
        dueInLabel.translatesAutoresizingMaskIntoConstraints = false
        [dueInLabel.centerYAnchor.constraint(equalTo: totalDueDescriprionLabel.bottomAnchor, constant: 4),
         dueInLabel.rightAnchor.constraint(equalTo: creditCardContainerView.rightAnchor, constant: -16)].forEach({$0.isActive = true})
        dueInLabel.text = "DUE IN 7 DAYS"
        dueInLabel.textColor = AppTheme.selectedColor
        dueInLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        
        let seperatorTwo = SeperatorView.init()
        view.addSubview(seperatorTwo)
        seperatorTwo.translatesAutoresizingMaskIntoConstraints = false
        [seperatorTwo.topAnchor.constraint(equalTo: creditCardContainerView.bottomAnchor, constant: 38),
         seperatorTwo.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
         seperatorTwo.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0),
         seperatorTwo.heightAnchor.constraint(equalToConstant: 2)].forEach({$0.isActive = true})
        
        let anotherCardLabel = UILabel()
        view.addSubview(anotherCardLabel)
        anotherCardLabel.translatesAutoresizingMaskIntoConstraints = false
        [anotherCardLabel.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 16),
         anotherCardLabel.topAnchor.constraint(equalTo: seperatorTwo.bottomAnchor, constant: 28)].forEach({$0.isActive = true})
        anotherCardLabel.textColor = AppTheme.cardsControllertextColor
        anotherCardLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        anotherCardLabel.text = "have another card?"
        
        let descriprionLabel = UILabel()
        view.addSubview(descriprionLabel)
        descriprionLabel.translatesAutoresizingMaskIntoConstraints = false
        [descriprionLabel.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 16),
         descriprionLabel.topAnchor.constraint(equalTo: anotherCardLabel.bottomAnchor, constant: 16)].forEach({$0.isActive = true})
        descriprionLabel.textColor = AppTheme.cardsControllertextColor
        descriprionLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        descriprionLabel.text = "add all your credit cards to stay on top \nof bill payments."
        
        
        
        let bottomAddNewCardEmbossView = CurvedEmbossView.init(circular: true, borderColor: nil, borderThickness: nil)
        view.addSubview(bottomAddNewCardEmbossView)
        bottomAddNewCardEmbossView.translatesAutoresizingMaskIntoConstraints = false
        [bottomAddNewCardEmbossView.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 8),
         bottomAddNewCardEmbossView.topAnchor.constraint(equalTo: descriprionLabel.bottomAnchor, constant: 8),
         bottomAddNewCardEmbossView.heightAnchor.constraint(equalToConstant: 90),
         bottomAddNewCardEmbossView.widthAnchor.constraint(equalToConstant: 190)].forEach({$0.isActive = true})
        
        let bottomPlusButton = InnerEmbossView.init(circular: true, borderColor: nil, borderThickness: nil)
        view.addSubview(bottomPlusButton)
        bottomPlusButton.translatesAutoresizingMaskIntoConstraints = false
        [bottomPlusButton.leftAnchor.constraint(equalTo: bottomAddNewCardEmbossView.leftAnchor, constant: 20),
         bottomPlusButton.centerYAnchor.constraint(equalTo: bottomAddNewCardEmbossView.centerYAnchor, constant: 0),
         bottomPlusButton.heightAnchor.constraint(equalToConstant: 50),
         bottomPlusButton.widthAnchor.constraint(equalToConstant: 50)].forEach({$0.isActive = true})
        bottomPlusButton.setImage(image: UIImage.init(named: "addIcon")!)
        
        let bottomAddNewLabel = UILabel()
        view.addSubview(bottomAddNewLabel)
        bottomAddNewLabel.translatesAutoresizingMaskIntoConstraints = false
        [bottomAddNewLabel.centerYAnchor.constraint(equalTo: bottomPlusButton.centerYAnchor, constant: 0),
         bottomAddNewLabel.leftAnchor.constraint(equalTo: bottomPlusButton.rightAnchor, constant: 16)].forEach({$0.isActive = true})
        bottomAddNewLabel.text = "Add new"
        bottomAddNewLabel.textColor = AppTheme.cardsControllertextColor
        bottomAddNewLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
    }
}
