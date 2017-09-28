//
//  ViewController.swift
//  RedditMini
//
//  Created by Alyssa Mae Sta Cruz on 27/09/2017.
//  Copyright © 2017 Alyssa. All rights reserved.
//

import UIKit

var posts = [Thing]()
let jsonUrlString = "https://api.reddit.com/r/iOSProgramming/"
let cellId = "customCell"


class FeedViewController: UIViewController {

    @IBOutlet weak var feedCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.feedCollectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        self.feedCollectionView.delegate = self
        self.feedCollectionView.dataSource = self
        
        //posts = initSampleData()
        
        
        
        guard let url = URL(string: jsonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            print("has some data")
            
            do{
                let subReddit = try JSONDecoder().decode(Listing.self, from: data)
                
                DispatchQueue.main.async {
                    posts = subReddit.data.children
                    self.feedCollectionView.reloadData()
                }
               
            }catch let jsonError{
                print(jsonError)
            }
            
            }.resume()
    }
}

