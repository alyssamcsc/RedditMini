//
//  JsonStruct.swift
//  RedditMini
//
//  Created by Alyssa Mae Sta Cruz on 27/09/2017.
//  Copyright © 2017 Alyssa. All rights reserved.
//

import Foundation

struct Listing: Decodable {
    let data :ListingData
    let kind: String
}

struct ListingData: Decodable {
    let after: String?
    let before: String?
    let children :[Thing]
    let modhash: String
}

struct Thing: Decodable{
    let data: Link
    let kind: String
}

struct Link: Decodable{
    let title:String?
    let permalink: String? //for link only
    let author: String
    let selfText: String? // for link only
    let numComments: Int?
    let body: String? // for comment only
    
    enum CodingKeys: String, CodingKey {
        case title
        case permalink
        case author
        case selfText = "selftext"
        case numComments = "num_comments"
        case body
    }
    
}
