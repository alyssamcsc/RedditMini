//
//  ViewController.swift
//  RedditMini
//
//  Created by Alyssa Mae Sta Cruz on 27/09/2017.
//  Copyright © 2017 Alyssa. All rights reserved.
//

import UIKit

let jsonUrlString = "https://api.reddit.com/r/iOSProgramming/"
let cellId = "customCell"
struct SubReddit: Decodable {
    let data :SubRedditData
    let kind: String
}

struct SubRedditData: Decodable {
    let after: String
    let before: String?
    let children :[SubRedditChildren]
    let modhash: String
}

struct SubRedditChildren: Decodable{
    let data: ChildrenData
    let kind: String
}

struct ChildrenData: Decodable{
    let title:String
    
}


class Post {
    var name: String?
    var contentText:String?
}

var posts = [Post]()

class FeedViewController: UIViewController {

    @IBOutlet weak var feedCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.feedCollectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        self.feedCollectionView.delegate = self
        self.feedCollectionView.dataSource = self
        
        posts = initSampleData()
        
        
        
        guard let url = URL(string: jsonUrlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            print("has some data")
            
            do{
                let subReddit = try JSONDecoder().decode(SubReddit.self, from: data)
                print(subReddit.data.children)
            }catch let jsonError{
                print(jsonError)
            }
            
            
            
            
            }.resume()
        
        
    }
    
    
    func initSampleData() -> [Post] {
        let postAlyssa = Post()
        postAlyssa.name = "Alyssa Mae Sta Cruz"
        postAlyssa.contentText = "Look at the iPhone 8. So nice!"
        
        let postAnita = Post()
        postAnita.name = "Anita la Puebla"
        postAnita.contentText = "Short stories are some of the first pieces of literature that children become acquainted with in their lives. However, as we age, sometimes we forget what these stories are about, their key elements or the ways that they continue to shape our lives as we grow."
        
        return [postAlyssa, postAnita]
    }

}

