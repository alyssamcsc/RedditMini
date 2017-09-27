//
//  FeedCollectionViewCell.swift
//  RedditMini
//
//  Created by Alyssa Mae Sta Cruz on 27/09/2017.
//  Copyright © 2017 Alyssa. All rights reserved.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    var post: Post?{
        didSet{
            if let name = post?.name{
                let attributedText = NSMutableAttributedString(string: name, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor.rgb(red: 155, green: 161, blue: 171)])
                
                attributedText.append(NSAttributedString(string: "\nTime * link", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor.rgb(red: 155, green: 161, blue: 171)]))
                
                nameLabel.attributedText = attributedText
            }
            if let contentText = post?.contentText{
                contentTextView.text = contentText
            }
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(Coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        
        
        return label
    }()
    
    let profileImageView: UIImageView = {
        // MARK: make profile image to a circle try in didlayoutsubviews
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.gray
        //imageView.image = UIImage(named: "dp1")
        imageView.contentMode = .scaleAspectFit
        //imageView.layer.cornerRadius = 20 //
        return imageView
    }()
    
    let contentTextView: UITextView = {
        let textView = UITextView()
        //textView.text = "Developing writers can often benefit from examining an essay, a paragraph, or even a sentence to determine what makes it effective. On the following pages are several paragraphs for you to evaluate on your own, along with the Writing Center's explanation."
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    let contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dp2")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    let likesCommentsLabel: UILabel = {
        let label = UILabel()
        label.text = "400 Likes  10.7K Comments"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor.rgb(red: 155, green: 161, blue: 171)
        return label
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 226, green: 228, blue: 232)
        return view
    }()
    
    let voteButton = FeedCollectionViewCell.buttonForTitle(title: "Vote", imageName: "vote")
    let commentButton = FeedCollectionViewCell.buttonForTitle(title: "Comment", imageName: "comment")
    let shareButton = FeedCollectionViewCell.buttonForTitle(title: "Share", imageName: "share")
    
    
    static func buttonForTitle(title: String, imageName: String) -> UIButton{
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.rgb(red: 143, green: 150, blue: 163) , for: .normal)
        //        button.setImage(UIImage(named: imageName), for: .normal) //for button icon
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
    }
    
    
    func setupViews() {
        backgroundColor = UIColor.white
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(contentTextView)
        addSubview(contentImageView)
        //addSubview(likesCommentsLabel)
        addSubview(dividerLineView)
        addSubview(voteButton)
        addSubview(commentButton)
        addSubview(shareButton)
        
        
        
        addConstraintsWithFormat(format: "H:|-8-[v0(36)]-8-[v1]|", views: profileImageView,nameLabel)
        
        addConstraintsWithFormat(format: "H:|-4-[v0]-4-|", views: contentTextView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: contentImageView)
        
        //addConstraintsWithFormat(format: "H:|-12-[v0]|", views: likesCommentsLabel) //implement if button title not work
        
        addConstraintsWithFormat(format: "H:|-12-[v0]-12-|", views: dividerLineView)
        
        addConstraintsWithFormat(format: "H:|[v0(v2)][v1(v2)][v2]|", views: voteButton, commentButton, shareButton)
        
        addConstraintsWithFormat(format: "V:|-12-[v0]", views: nameLabel)
        
        addConstraintsWithFormat(format: "V:|-8-[v0(44)]|", views: profileImageView)
        
        addConstraintsWithFormat(format: "V:|-8-[v0(44)]-4-[v3(0.4)]-4-[v1]-4-[v2(200)][v4(44)]|", views: profileImageView, contentTextView, contentImageView, dividerLineView, voteButton)
        
        addConstraintsWithFormat(format: "V:[v0(44)]|", views: commentButton)
        
        addConstraintsWithFormat(format: "V:[v0(44)]|", views: shareButton)
        
        
        
    }
}





