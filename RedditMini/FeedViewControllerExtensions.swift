//
//  FeedViewControllerExtensions.swift
//  RedditMini
//
//  Created by Alyssa Mae Sta Cruz on 27/09/2017.
//  Copyright © 2017 Alyssa. All rights reserved.
//

import UIKit

extension FeedViewController:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedCollectionViewCell
        
        cell.post = posts[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let titleText = posts[indexPath.item].data.title{
            
           var knownHeight: CGFloat =  8 + 18  + 44 //from constraints
            
            let rect = NSString(string: titleText).boundingRect(with: CGSize(width: view.frame.width, height: 100), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes:[NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: (14))], context: nil)
            
            knownHeight = rect.height + knownHeight
            
            if let contentText = posts[indexPath.item].data.selfText
            {
                let rect = NSString(string: contentText).boundingRect(with: CGSize(width: view.frame.width, height: 100), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes:[NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: (12))], context: nil)
                
                knownHeight = rect.height + knownHeight
                
            }
            
            return CGSize(width: view.frame.width, height: knownHeight + 30)
        }
    
        return CGSize(width: view.frame.width, height: 500)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "feedToDetailSeg", sender: self)
    }
    
}
