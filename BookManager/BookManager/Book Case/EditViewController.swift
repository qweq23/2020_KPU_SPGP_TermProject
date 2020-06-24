//
//  EditViewController.swift
//  BookManager
//
//  Created by kpugame on 2020/06/24.
//  Copyright © 2020 kpugame. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var textView: UITextView!
    
    let dateFomatter = DateFormatter()
    
    var book = Book()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.identifier)
        if segue.identifier == "save" {
            book.userDate = dateFomatter.string(from: datePicker.date)
            book.userText = textView.text
            
            print(book.userText)
            bookManager.save()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFomatter.dateFormat = "YY.MM.DD"
        
        datePicker.setDate(dateFomatter.date(from: book.userDate)!, animated: false)
        textView.text = book.userText
    }
    

}
