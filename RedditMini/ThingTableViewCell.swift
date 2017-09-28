//
//  ThingTableViewCell.swift
//  RedditMini
//
//  Created by Alyssa Mae Sta Cruz on 28/09/2017.
//  Copyright © 2017 Alyssa. All rights reserved.
//

import UIKit

class ThingTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        if reuseIdentifier == "commentCellId" {
            setupCommentViews()
        }else{
            setupViews()
        }
        
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(Coder:) has not been implemented")
    }
    
    var post: Thing?{
        didSet{
            if let name = post?.data.author{
                let attributedText = NSMutableAttributedString(string: name, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor.rgb(red: 155, green: 161, blue: 171)])
                
                attributedText.append(NSAttributedString(string: " * Time * Link", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor.rgb(red: 155, green: 161, blue: 171)]))
                
                nameLabel.attributedText = attributedText
            }
            if let titleText = post?.data.title{
                titleTextView.text = titleText
            }
            
            if let contentText = post?.data.selfText{
                contentTextView.text = contentText
            }
            
            if let numComments = post?.data.numComments{
                commentButton.titleLabel?.text = String(numComments)
            }
        }
    }
    
    var comment: Thing?{
        didSet{
            if let name = comment?.data.author{
                let attributedText = NSMutableAttributedString(string: name, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor.rgb(red: 155, green: 161, blue: 171)])
                
                attributedText.append(NSAttributedString(string: " * Time", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 12), NSAttributedStringKey.foregroundColor: UIColor.rgb(red: 155, green: 161, blue: 171)]))
                
                nameLabel.attributedText = attributedText
            }
            if let titleText = comment?.data.body{
                titleTextView.text = titleText
            }
            
           
        }
    }
    
    
    
    
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        
        
        return label
    }()
    
    let titleTextView: UITextView = {
        let textView = UITextView()
        
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isScrollEnabled = false
        textView.isEditable =  false
        return textView
    }()
    
    let contentTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 12)
        textView.isScrollEnabled = false
        textView.textColor = UIColor.rgb(red: 155, green: 161, blue: 171)
        textView.isEditable = false
        return textView
    }()
    
    
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 226, green: 228, blue: 232)
        return view
    }()
    
    let voteButton = ThingTableViewCell.buttonForTitle(title: "Vote", imageName: "vote")
    let commentButton = ThingTableViewCell.buttonForTitle(title: "Comment", imageName: "comment")
    let shareButton = ThingTableViewCell.buttonForTitle(title: "Share", imageName: "share")
    
    
    static func buttonForTitle(title: String, imageName: String) -> UIButton{
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.rgb(red: 143, green: 150, blue: 163) , for: .normal)
        button.setImage(UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = UIColor.rgb(red: 143, green: 150, blue: 163)
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.isEnabled = false
        return button
    }
    
    
    func setupViews() {
        backgroundColor = UIColor.white
        addSubview(nameLabel)
        addSubview(dividerLineView)
        addSubview(titleTextView)
        addSubview(contentTextView)
        addSubview(voteButton)
        addSubview(commentButton)
        addSubview(shareButton)
        
        addConstraintsWithFormat(format: "H:|-4-[v0]-4-|", views: nameLabel)
        
        addConstraintsWithFormat(format: "H:|-4-[v0]-4-|", views: titleTextView)
        
        addConstraintsWithFormat(format: "H:|-4-[v0]-4-|", views: contentTextView)
        
        addConstraintsWithFormat(format: "H:|-12-[v0]-12-|", views: dividerLineView)
        
        addConstraintsWithFormat(format: "H:|[v0(v2)][v1(v2)][v2]|", views: voteButton, commentButton, shareButton)
        
        addConstraintsWithFormat(format: "V:|-8-[v0(18)]-4-[v1(0.4)][v2][v3][v4(44)]|", views: nameLabel, dividerLineView, titleTextView, contentTextView, voteButton)
        
        addConstraintsWithFormat(format: "V:[v0(44)]|", views: commentButton)
        
        addConstraintsWithFormat(format: "V:[v0(44)]|", views: shareButton)
    }
    
    func setupCommentViews() {
        backgroundColor = UIColor.white
        addSubview(nameLabel)
        addSubview(titleTextView)
        
        addConstraintsWithFormat(format: "H:|-8-[v0]-4-|", views: nameLabel)
        
        addConstraintsWithFormat(format: "H:|-4-[v0]-4-|", views: titleTextView)
        
        addConstraintsWithFormat(format: "V:|-8-[v0(18)][v1]|", views: nameLabel, titleTextView)
        
    }
    
    
}

