//
//  BookSearchViewController.swift
//  BookManager
//
//  Created by kpugame on 2020/06/09.
//  Copyright © 2020 kpugame. All rights reserved.
//

import UIKit

class BookSearchViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var keywordTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    let category: [String] = [
        "제목",
        "저자",
        "출판사"
    ]
    
    let catgToQueryVal: [String: String] = [
        "제목": "d_titl",
        "저자": "d_auth",
        "출판사": "d_publ"
    ]
    
    var selectedCatg: String = "제목"
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "BookTable" {
            if let bookTableVC = segue.destination as? BookSearchTableViewController {
                bookTableVC.queryVar = catgToQueryVal[selectedCatg]!
                bookTableVC.queryValue = keywordTextField.text!
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
    }

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        category.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // 피커뷰에 들어갈 문자열을 알려주는 함수
        return category[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 피커뷰가 선택되었을 때
        selectedCatg = category[row]
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
