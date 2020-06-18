//
//  tmp.swift
//  BookManager
//
//  Created by kpugame on 2020/06/18.
//  Copyright © 2020 kpugame. All rights reserved.
//

import Foundation


func test() {
    let fileManager = FileManager.default
    let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    print(documentsURL)
    
    let fileName = "books"
    let filePath = documentsURL.path + "/\(fileName)"
    if fileManager.fileExists(atPath: filePath) {
        print("파일 있음!")
    } else {
        print("파일 없음 만들게~")
        
        if fileManager.createFile(atPath: filePath, contents: nil, attributes: nil) {
            print("파일 생성 완료")
        } else {
            print("파일 생성 실패..")
        }
    }
    
    
    let outString = "Book"
    // 파일 쓰기
    do {
        try outString.write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8)
    } catch let error{
        print(error)
    }
    
    
    // 파일 읽기
    let dataBuffer: Data = fileManager.contents(atPath: filePath) ?? Data()
    let dataString = String(data: dataBuffer, encoding: String.Encoding.utf8)
    print("내용은?: \(String(describing: dataString))")
}

func saveData() {
    
}
