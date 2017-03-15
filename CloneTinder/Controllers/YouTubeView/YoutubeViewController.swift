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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

class VideoCell:UICollectionViewCell {
    
    override init(frame:CGRect){
        super.init(frame: frame)
        setupViews()
    }
    
    let thumbnailImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.blue
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let separatorView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        addSubview(thumbnailImageView)
        addSubview(separatorView)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": thumbnailImageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"V:|-16-[v0]-16-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": thumbnailImageView]))
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": separatorView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat:"V:[v0(1)]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": separatorView]))
        
        //thumbnailImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    }
    
}
