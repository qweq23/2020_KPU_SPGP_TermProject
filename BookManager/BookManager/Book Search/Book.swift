//
//  Book.swift
//  BookManager
//
//  Created by kpugame on 2020/06/11.
//  Copyright © 2020 kpugame. All rights reserved.
//

import UIKit
import Foundation

class Book: NSObject, NSCoding {
    
    var title: String
    var link: String
    var image: UIImage
    var author: String
    var publisher: String
    var pubdate: String
    var price: String
    var dscr: String
    
    var userDate = String()
    var userText = String()
    
    func encode(with coder: NSCoder) {
        coder.encode(title, forKey: "title")
        coder.encode(link, forKey: "link")
        coder.encode(image, forKey: "image")
        coder.encode(author, forKey: "author")
        coder.encode(publisher, forKey: "publisher")
        coder.encode(pubdate, forKey: "pubdate")
        coder.encode(price, forKey: "price")
        coder.encode(description, forKey: "description")

        coder.encode(userDate, forKey: "userDate")
        coder.encode(userText, forKey: "userText")
    }
    
    required init?(coder: NSCoder) {
        title = coder.decodeObject(forKey: "title") as! String
        link = coder.decodeObject(forKey: "link") as! String
        image = coder.decodeObject(forKey: "image") as! UIImage
        author = coder.decodeObject(forKey: "author") as! String
        publisher = coder.decodeObject(forKey: "publisher") as! String
        pubdate = coder.decodeObject(forKey: "pubdate") as! String
        price = coder.decodeObject(forKey: "price") as! String
        dscr = coder.decodeObject(forKey: "description") as! String
        
        userDate = coder.decodeObject(forKey: "userDate") as! String
        userText = coder.decodeObject(forKey: "userText") as! String
    }
    
    init(title: String = "", link: String = "", image: UIImage = UIImage(named: "noImage")!, author: String = "",
         publisher: String = "", pubdate: String = "", price: String = "", description: String = "") {
        self.title = title
        self.link = link
        self.image = image
        self.author = author
        self.publisher = publisher
        self.price = price
        self.pubdate = pubdate
        self.dscr = description
    }
}
