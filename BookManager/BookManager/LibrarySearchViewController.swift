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
        "가평군, 포천시",
        "김포시, 파주시",
        "고양시",
        "동두천시, 양주시, 의정부시",
        "구리시, 남양주시, 하남시",
        "양평군, 여주시, 이천시, 부발읍",
        "광주시, 용인시",
        "성남시, 과천시, 의왕시",
        "수원시",
        "부천시, 광명시",
        "시흥시, 안양시",
        "안산시, 군포시",
        "화성시, 오산시",
        "안성시, 평택시",
    ]
    
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

        pickerView.delegate = self
        pickerView.dataSource = self
    }
    


    @IBAction func searchLibrary(_ sender: Any) {
    }
    
}
