//
//  DetailViewController.swift
//  RedditMini
//
//  Created by Alyssa Mae Sta Cruz on 28/09/2017.
//  Copyright © 2017 Alyssa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    var permalink : String!
    var posts = [Thing]()
    let jsonUrlString = "https://api.reddit.com/r/iOSProgramming/"
    let commentCellId = "commentCellId"
    let postCellId =  "postCellId"
    
    var comments = [Thing]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ThingTableViewCell.self, forCellReuseIdentifier: postCellId)
        tableView.register(ThingTableViewCell.self, forCellReuseIdentifier: commentCellId)
        tableView.delegate = self
        tableView.dataSource = self
        
        fetchThings(urlString: "https://api.reddit.com\(permalink!)")
    }

    func fetchThings(urlString: String)  {
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            print("has some data")
            
            do{
                let listings = try JSONDecoder().decode([Listing].self, from: data)
                
                DispatchQueue.main.async {
                    self.comments.append(contentsOf:  listings[0].data.children)
                    self.comments.append(contentsOf:  listings[1].data.children)
                    self.tableView.reloadData()
                    print(listings[1].data.children)
                }
                
            }catch let jsonError{
                print(jsonError)
            }
            
            }.resume()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ThingTableViewCell
        
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: postCellId, for: indexPath) as! ThingTableViewCell
            cell.post = comments[indexPath.row]
        }else{
            cell = tableView.dequeueReusableCell(withIdentifier: commentCellId, for: indexPath) as! ThingTableViewCell
            cell.comment = comments[indexPath.row]
        }
        
        
        return cell
    }
    
}
