//
//  BookManager.swift
//  BookManager
//
//  Created by kpugame on 2020/06/18.
//  Copyright © 2020 kpugame. All rights reserved.
//

import Foundation

class BookManager {
    var books: [Book] = []
    var documentsURL: URL
    let fileName: String = "books.archive"
    var filePath: String
    
    init() {
        let fileManager = FileManager.default
        
        self.documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        self.filePath = documentsURL.path + "/\(fileName)"
    }
    
    func addBook(book: Book) {
        books.append(book)
        save()
    }
    
    func loadFromFile() {
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileName = "books.archive"
        let filePath = documentsURL.path + "/\(fileName)"
        
        if fileManager.fileExists(atPath: filePath) {
            print("파일 있음!")
            
            let dataBuffer: Data = fileManager.contents(atPath: filePath) ?? Data()
            do {
                if let data = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dataBuffer) as? [Book] {
                    books = data
                }
            } catch {
                print("파일 읽을 수 없음")
            }
            
        }
    }
    
    func save( ) {
        let pathURL = documentsURL.appendingPathComponent(fileName)
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: books, requiringSecureCoding: false)
            try data.write(to: pathURL)
            return
        } catch {
            print("저장 못 함")
        }
    }
}
