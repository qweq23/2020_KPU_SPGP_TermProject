//
//  LibrarySearchViewController.swift
//  BookManager
//
//  Created by kpugame on 2020/05/31.
//  Copyright © 2020 kpugame. All rights reserved.
//

import UIKit

class LibrarySearchViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var searchButton: UIButton!
    
    var pickerDataSource = [
       "가평군",
       "고양시",
       "과천시",
       "광명시",
       "광주시",
       "구리시",
       "군포시",
       "김포시",
       "남양주시",
       "동두천시",
       "부천시",
       "성남시",
       "수원시",
       "시흥시",
       "안산시",
       "안성시",
       "안양시",
       "양주시",
       "양평군",
       "여주시",
       "연천군",
       "오산시",
       "용인시",
       "의왕시",
       "의정부시",
       "이천시",
       "파주시",
       "평택시",
       "포천시",
       "하남시",
       "화성시",
    ]
    
    // 피커뷰를 움직이지 않는다면 아무 값도 할당되지 않기 때문에 디폴트 값을 줘야한다.
    var selected_area: String = "가평군"
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(pickerDataSource.count)

        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LibraryTable" {
            if let libraryTableVC = segue.destination as? LibraryTableViewController {
                libraryTableVC.search_area = selected_area
            }
        }
    }
    
    // 데이터 선택되었을 때?
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selected_area = pickerDataSource[row]
        print(selected_area)
    }


    @IBAction func searchLibrary(_ sender: Any) {
    }
    
}
