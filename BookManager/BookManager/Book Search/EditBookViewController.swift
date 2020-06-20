//
//  EditBookViewController.swift
//  BookManager
//
//  Created by kpugame on 2020/06/11.
//  Copyright © 2020 kpugame. All rights reserved.
//

import UIKit

class EditBookViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var commentTextView: UITextView! {
        didSet {
            commentTextView.layer.borderWidth = 1
            commentTextView.layer.borderColor = UIColor.black.cgColor
        }
    }
    
    var book = Book()
    let formmater = DateFormatter()

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToMain" {
            book.userDate = formmater.string(from: datePicker.date)
            book.userText = commentTextView.text
            
            if let mainVC = segue.destination as? BookcaseTableViewController {
                mainVC.bookManager.addBook(book: book)
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formmater.dateFormat = "yyyyMMdd"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 사용자가 화면 아무곳이나 누르면 키보드를 사라지게 하는 것
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 엔터키를 누르면 키보드를 화면에서 사라지게 하는 것
        textField.resignFirstResponder()    // 텍스트 필드 비활성화
        return true
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
