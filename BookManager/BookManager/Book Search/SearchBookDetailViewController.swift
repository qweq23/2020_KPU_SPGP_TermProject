//
//  SearchBookDetailViewController.swift
//  BookManager
//
//  Created by kpugame on 2020/05/28.
//  Copyright © 2020 kpugame. All rights reserved.
//

import UIKit

class SearchBookDetailViewController: UIViewController {
    
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var book = Book()
    
    @IBAction func cancelToSearchBookDetail(segue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToEdit" {
            if let editVC = segue.destination as? EditBookViewController {
                editVC.book = self.book
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coverImageView.image = book.image
        
        titleLabel.text = book.title
        authorLabel.text = book.author
        publisherLabel.text = book.publisher
        descriptionLabel.text = book.dscr
        
        book.printInfo()
    }
    

}
