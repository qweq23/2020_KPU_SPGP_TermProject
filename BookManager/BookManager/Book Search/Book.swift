//
//  Book.swift
//  BookManager
//
//  Created by kpugame on 2020/06/11.
//  Copyright © 2020 kpugame. All rights reserved.
//

import UIKit
import Foundation

class Book {
    var title: String
    var link: String
    var image: UIImage
    var author: String
    var publisher: String
    var pubdate: String
    var price: String
    var description: String
    
    var userDate = String()
    var userText = String()
    
    init(title: String = "", link: String = "", image: UIImage = UIImage(named: "noImage")!, author: String = "",
         publisher: String = "", pubdate: String = "", price: String = "", description: String = "") {
        self.title = title
        self.link = link
        self.image = image
        self.author = author
        self.publisher = publisher
        self.price = price
        self.pubdate = pubdate
        self.description = description
    }
}
