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
        if let contentText = posts[indexPath.item].contentText{
            let rect = NSString(string: contentText).boundingRect(with: CGSize(width: view.frame.width, height: 100), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes:[NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: (14))], context: nil)
            
            let knownHeight: CGFloat = 8 + 44 + 4 + 4 + 200  + 8 + 44
            return CGSize(width: view.frame.width, height: rect.height + knownHeight + 16)
        }
        return CGSize(width: view.frame.width, height: 500)
    }
    
}
