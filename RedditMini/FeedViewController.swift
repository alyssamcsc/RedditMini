//
//  ViewController.swift
//  RedditMini
//
//  Created by Alyssa Mae Sta Cruz on 27/09/2017.
//  Copyright © 2017 Alyssa. All rights reserved.
//

import UIKit


class FeedViewController: UIViewController {
    var listing: Listing?
    var posts = [Thing]()
    let jsonUrlString = "https://api.reddit.com/r/iOSProgramming/"
    let cellId = "customCell"
    
    @IBOutlet weak var feedCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.feedCollectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        self.feedCollectionView.delegate = self
        self.feedCollectionView.dataSource = self
        fetchThings(urlString: jsonUrlString)
        
    }
    
 func fetchThings(urlString: String)  {
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            print("has some data")
            
            do{
                self.listing = try JSONDecoder().decode(Listing.self, from: data)
                
                DispatchQueue.main.async {
                    self.posts.append(contentsOf: self.listing!.data.children)
                    self.feedCollectionView.reloadData()
                    print("Count \(self.posts.count)")
                }
                
            }catch let jsonError{
                print(jsonError)
            }
            
            }.resume()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "feedToDetailSeg" {
            if let destination = segue.destination as? DetailViewController {
                if let indexPath = feedCollectionView.indexPathsForSelectedItems?.first{
                   destination.permalink = posts[indexPath.item].data.permalink
                }
            }
            
        }
    }
    
}

