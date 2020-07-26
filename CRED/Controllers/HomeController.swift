//  ViewController.swift
//  CRED
//
//  Created by SWAT on 26/07/20.
//

import UIKit

class HomeController: UIViewController {
    
    var avatarImageView: BaseImageView!
    var profileNameLabel: UILabel!
    var controlButtonView: CircularEmbossView!
    var layout: UICollectionViewFlowLayout!
    var collectionView: UICollectionView!
    var controlImageView: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    
    func initViews(){
        view.backgroundColor = AppTheme.APP_BACKGROUNDCOLOR
        let guide = view.layoutMarginsGuide
        
        let profileInneView = InnerEmbossView.init(circular: true, borderColor: nil, borderThickness: nil)
        view.addSubview(profileInneView)
        profileInneView.translatesAutoresizingMaskIntoConstraints = false
        [profileInneView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 8),
         profileInneView.leftAnchor.constraint(equalTo: guide.leftAnchor, constant: 8),
         profileInneView.heightAnchor.constraint(equalToConstant: 80),
         profileInneView.widthAnchor.constraint(equalToConstant: 80)].forEach({$0.isActive = true})
        
        
        avatarImageView = BaseImageView.init(with: UIColor.blue, circular: true, shadow: false, borderColor: nil, borderThickness: nil)
        view.addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        [avatarImageView.centerYAnchor.constraint(equalTo: profileInneView.centerYAnchor, constant: 0),
         avatarImageView.centerXAnchor.constraint(equalTo: profileInneView.centerXAnchor, constant: 0),
         avatarImageView.heightAnchor.constraint(equalToConstant: 60),
         avatarImageView.widthAnchor.constraint(equalToConstant: 60)].forEach({$0.isActive = true})
        avatarImageView.image = UIImage.init(named: "avatar")
        
        profileNameLabel = UILabel()
        view.addSubview(profileNameLabel)
        profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        [profileNameLabel.centerXAnchor.constraint(equalTo: profileInneView.centerXAnchor, constant: 0),
         profileNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10)].forEach({$0.isActive = true})
        profileNameLabel.text = "SWAT"
        profileNameLabel.textColor = AppTheme.textColor
        profileNameLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        
        
        controlButtonView = CircularEmbossView.init(circular: true, borderColor: nil, borderThickness: nil)
        view.addSubview(controlButtonView)
        controlButtonView.translatesAutoresizingMaskIntoConstraints = false
        [controlButtonView.centerYAnchor.constraint(equalTo: profileInneView.centerYAnchor, constant: 0),
         controlButtonView.rightAnchor.constraint(equalTo: guide.rightAnchor, constant: -8),
         controlButtonView.heightAnchor.constraint(equalToConstant: 80),
         controlButtonView.widthAnchor.constraint(equalToConstant: 80)].forEach({$0.isActive = true})
        
        
        controlImageView = UIImageView.init()
        view.addSubview(controlImageView)
        controlImageView.translatesAutoresizingMaskIntoConstraints = false
        [controlImageView.centerYAnchor.constraint(equalTo: controlButtonView.centerYAnchor, constant: 0),
         controlImageView.centerXAnchor.constraint(equalTo: controlButtonView.centerXAnchor, constant: 0),
         controlImageView.widthAnchor.constraint(equalToConstant: 30),
         controlImageView.heightAnchor.constraint(equalToConstant: 30)].forEach({$0.isActive = true})
        controlImageView.image = UIImage.init(named: "Control")
        controlImageView.contentMode = .scaleAspectFit
        
        let controlLabel = UILabel()
        view.addSubview(controlLabel)
        controlLabel.translatesAutoresizingMaskIntoConstraints = false
        [controlLabel.centerXAnchor.constraint(equalTo: controlButtonView.centerXAnchor, constant: 0),
         controlLabel.bottomAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 0)].forEach({$0.isActive = true})
        controlLabel.text = "control"
        controlLabel.textColor = AppTheme.textColor
        controlLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        
        
        layout = UICollectionViewFlowLayout.init()
        layout?.itemSize = CGSize.init(width: 3 * view.bounds.width / 4, height: view.bounds.height - 300)
        layout?.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout?.minimumLineSpacing = 0
        collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout!)
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        [collectionView.centerXAnchor.constraint(equalTo: guide.centerXAnchor, constant: 8),
         collectionView.widthAnchor.constraint(equalToConstant: 20 + 3 * view.bounds.width / 4),
         collectionView.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 30),
         collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)].forEach({$0.isActive = true})
        collectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "SomeIdentifier")
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.clipsToBounds = false
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        
        view.clipsToBounds = true
    }


}


extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SomeIdentifier", for: indexPath) as! HomeCollectionViewCell
        return cell
    }
    
    
}

