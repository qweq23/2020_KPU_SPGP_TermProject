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
        
    }
    
    @IBAction func cancelToBookDetail(segue: UIStoryboardSegue) {
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        coverImageView.image = book.image
        dateLabel.text = book.userDate
        titleLabel.text = book.title
        authorLabel.text = book.author
        publisherLabel.text = book.publisher
        commentTextView.text = book.userText
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
