//
//  ParentController.swift
//  CRED
//
//  Created by SWAT on 26/07/20.
//

import UIKit


class ParentController: UIViewController{
    
    
    var scrollView: UIScrollView!
    let homeController = HomeController()
    let cardsController = CardsController()
    let lifeStyleController = LifeStyleController()
    var bottomNavigationView: BottomBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    func initViews(){
        
        let guide = view.layoutMarginsGuide
        view.backgroundColor = AppTheme.APP_BACKGROUNDCOLOR
        
        scrollView = UIScrollView.init()
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        [scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
         scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
         scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
         scrollView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -60)].forEach({$0.isActive = true})
        scrollView.clipsToBounds = true
        scrollView.isScrollEnabled = false
        
        self.addChild(homeController)
        scrollView.addSubview(homeController.view)
        homeController.view.translatesAutoresizingMaskIntoConstraints = false
        [homeController.view.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0),
         homeController.view.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
         homeController.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
         homeController.view.heightAnchor.constraint(equalTo: scrollView.heightAnchor, constant: 0),
         homeController.view.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0)].forEach({$0.isActive = true})
        
        self.addChild(cardsController)
        scrollView.addSubview(cardsController.view)
        cardsController.view.translatesAutoresizingMaskIntoConstraints = false
        [cardsController.view.leftAnchor.constraint(equalTo: homeController.view.rightAnchor, constant: 0),
         cardsController.view.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
         cardsController.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
         cardsController.view.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0)].forEach({$0.isActive = true})
        
        self.addChild(lifeStyleController)
        scrollView.addSubview(lifeStyleController.view)
        lifeStyleController.view.translatesAutoresizingMaskIntoConstraints = false
        [lifeStyleController.view.leftAnchor.constraint(equalTo: cardsController.view.rightAnchor, constant: 0),
         lifeStyleController.view.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
         lifeStyleController.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
         lifeStyleController.view.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0),
         lifeStyleController.view.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0)].forEach({$0.isActive = true})
        
        bottomNavigationView = BottomBar.init()
        view.addSubview(bottomNavigationView)
        bottomNavigationView.translatesAutoresizingMaskIntoConstraints = false
        [bottomNavigationView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
         bottomNavigationView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
         bottomNavigationView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: 0),
         bottomNavigationView.heightAnchor.constraint(equalToConstant: 60)].forEach({$0.isActive = true})
        bottomNavigationView.itemSelectionDelegate = self
        
        
    }
    
}



extension ParentController: BottomBarSelectionProtocol{
    func selectedItemAt(index: Int) {
        view.layer.removeAllAnimations()
            UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseIn,.curveEaseOut], animations: {
                self.scrollView.contentOffset.x = CGFloat(index) * self.view.bounds.width
            }, completion: nil)
    }
    
    
}
