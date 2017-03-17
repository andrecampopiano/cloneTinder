//
//  MenuBar.swift
//  CloneTinder
//
//  Created by André Luís  Campopiano on 17/03/17.
//  Copyright © 2017 André Luís  Campopiano. All rights reserved.
//

import UIKit


class MenuBar: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.rgb(red: 230,green: 32,blue: 31)
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        addSubview(collectionView)
        addConstraintWithFormat(formart: "H:|[v0]|", views: collectionView)
        addConstraintWithFormat(formart: "V:|[v0]|", views: collectionView)
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}
