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
        
        self.addChild(homeController)
        scrollView.addSubview(homeController.view)
        homeController.view.translatesAutoresizingMaskIntoConstraints = false
        [homeController.view.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0),
         homeController.view.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
         homeController.view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
         homeController.view.heightAnchor.constraint(equalTo: scrollView.heightAnchor, constant: 0),
         homeController.view.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0),
         homeController.view.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0)].forEach({$0.isActive = true})
        
        bottomNavigationView = BottomBar.init()
        view.addSubview(bottomNavigationView)
        bottomNavigationView.translatesAutoresizingMaskIntoConstraints = false
        [bottomNavigationView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
         bottomNavigationView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
         bottomNavigationView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: 0),
         bottomNavigationView.heightAnchor.constraint(equalToConstant: 60)].forEach({$0.isActive = true})
    }
    
}
