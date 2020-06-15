//
//  BookSearchViewController.swift
//  BookManager
//
//  Created by kpugame on 2020/06/09.
//  Copyright © 2020 kpugame. All rights reserved.
//

import UIKit

class BookSearchViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var keywordTextField: UITextField! {
        didSet {
            keywordTextField.delegate = self
        }
    }
    @IBOutlet weak var pickerView: UIPickerView! {
        didSet {
            pickerView.delegate = self
            pickerView.dataSource = self
        }
    }
    
    
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
