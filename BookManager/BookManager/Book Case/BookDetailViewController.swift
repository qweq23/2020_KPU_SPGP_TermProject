//
//  BookDetailViewController.swift
//  BookManager
//
//  Created by kpugame on 2020/05/28.
//  Copyright © 2020 kpugame. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {
    
    
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var commentTextView: UITextView!
    
    var book = Book()
    
    @IBAction func saveToBookDetail(segue: UIStoryboardSegue) {
        print("저장 하니?")
        print(book.userText)
        dateLabel.text = book.userDate
        commentTextView.text = book.userText
        
    }
    
    @IBAction func cancelToBookDetail(segue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BookEdit" {
            if let editVC = segue.destination as? EditViewController {
                editVC.book = self.book
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("원본일까? ", self.book)
        coverImageView.image = book.image
        dateLabel.text = book.userDate
        titleLabel.text = book.title
        authorLabel.text = book.author
        publisherLabel.text = book.publisher
        commentTextView.text = book.userText
    }

}
