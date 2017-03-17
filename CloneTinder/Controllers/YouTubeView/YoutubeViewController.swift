//
//  YoutubeViewController.swift
//  CloneTinder
//
//  Created by André Campopiano on 13/03/17.
//  Copyright © 2017 André Luís  Campopiano. All rights reserved.
//

import UIKit

class YoutubeViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Home"
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0
    }


}

class VideoCell:UICollectionViewCell {
    
    override init(frame:CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    let thumbnailImageView: UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.image = UIImage(named:"taylor-swift-2")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let separatorView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        
        return view
    }()
    
    let userProfileImageView:UIImageView = {
       
        let imageView = UIImageView()
        imageView.image = UIImage(named: "taylor_swift_profile")
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        
        return imageView
        
    }()
    
    let titleLabel:UILabel = {
       
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Taylor Swift - Blank Space"
        return label
        
    }()
    
    let subTitle:UITextView = {
        
        let text = UITextView()

        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "Taylor Swift Vevo - 1,604,345,900 views - 2 years ago"
        text.textContainerInset = UIEdgeInsetsMake(0,-4,0,0)
        text.textColor = UIColor.lightGray
        return text
    }()
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        addSubview(userProfileImageView)
        addSubview(titleLabel)
        addSubview(subTitle)
        
        //configura as constraints
        
        //horizontal constraints
        addConstraintWithFormat(formart: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintWithFormat(formart: "H:|[v0]|", views: separatorView)
        addConstraintWithFormat(formart: "H:|-16-[v0(44)]", views: userProfileImageView)
        
        //vertical constraints
        addConstraintWithFormat(formart: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView,userProfileImageView,separatorView)
        
        
        //top constraints
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        
        
        //left constraints
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        

        
        //right constraints
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        

        //height constraints
        addConstraint(NSLayoutConstraint(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        //subTitle
        //top constraints
        addConstraint(NSLayoutConstraint(item: subTitle, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        
        //left constraints
        addConstraint(NSLayoutConstraint(item: subTitle, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        
        //right constraints
        addConstraint(NSLayoutConstraint(item: subTitle, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        
        
        //height constraints
        addConstraint(NSLayoutConstraint(item: subTitle, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
        

    }
    
}

extension UIView{
    func addConstraintWithFormat(formart:String, views:UIView...){
        var viewDictionary = [ String : UIView ]()
        for (index,view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat:formart, options: NSLayoutFormatOptions(), metrics: nil, views: viewDictionary))
        
    }
}
