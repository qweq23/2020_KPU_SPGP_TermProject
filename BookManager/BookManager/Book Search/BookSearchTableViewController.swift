//
//  BookSearchTableViewController.swift
//  BookManager
//
//  Created by kpugame on 2020/06/09.
//  Copyright © 2020 kpugame. All rights reserved.
//

import UIKit

class BookSearchTableViewController: UITableViewController, XMLParserDelegate {
    
    var parser = XMLParser()
    
    let clientID: String = "zXYfFfpgUra2QxMwDRpk"
    let clientSecret: String = "orJlgTQcLV"
    
    var element = NSString()
    var tmpBook = [NSString: NSMutableString]()
    var books = [Dictionary<NSString,NSMutableString>]()
    
    var queryVar = String()
    var queryValue = String()
    var image = UIImage()
    
    func requestAPIToNaver() {
        let query: String  = "https://openapi.naver.com/v1/search/book_adv.xml?\(self.queryVar)=\(self.queryValue)&display=30"
        let encodedQuery: String = query.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        let queryURL: URL = URL(string: encodedQuery)!
         
        var requestURL = URLRequest(url: queryURL)
        requestURL.addValue(clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        requestURL.addValue(clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
          
        let task = URLSession.shared.dataTask(with: requestURL) { data, response, error in
            guard error == nil else {
                print(error as Any)
                return
            }
            
            guard let data = data else {
                print("Data is empty")
                return
            }
            
            // 데이터 초기화 해야함

            let parser = XMLParser(data: Data(data))
            parser.delegate = self

            print("파싱 시작")
            let success: Bool = parser.parse()
            if success {
                // requestAPIToNaver 이 함수가 불렸다고 해서 바로 파싱하지 않음;;
                // 잘은 모르겠지만 네트워크 요청 때문이라고 생각함
                // 파싱이 끝난 데이터를 가지고 뭔가를 하고 싶다면 여기서 해라
                print(self.books)
            } else {
                print("파싱 실패")
            }
            
        }
        task.resume()
    }
    
    
    func getPosterImage(index: Int) -> UIImage {
        guard let imageURL = books[index]["image"] else {
            return UIImage(named: "noImage")!
        }
        if let url = URL(string: imageURL as String) {
            if let imgData = try? Data(contentsOf: url) {
                if let image = UIImage(data: imgData) {
                    return image
                }
            }
        }
        return UIImage(named: "noImage")!
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        parser.delegate = self
        
        requestAPIToNaver()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookTableViewCell
        
        cell.coverImage = getPosterImage(index: indexPath.row)
        
        cell.title = books[indexPath.row]["title"]! as String
        cell.author = books[indexPath.row]["author"]! as String
        if let publisher = books[indexPath.row]["publisher"] {
            cell.publisher = publisher as String
        }
        
        return cell
    }
    
  
    // parser가 새로운 row를 발견했을 때
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
            
        element = elementName as NSString
        
        if element.isEqual(to: "item"){
            self.tmpBook = [
                NSString("title"): NSMutableString(),
                NSString("link"): NSMutableString(),
                NSString("image"): NSMutableString(),
                NSString("author"): NSMutableString(),
                NSString("price"): NSMutableString(),
                NSString("publisher"): NSMutableString(),
                NSString("pubdate"): NSMutableString(),
                NSString("description"): NSMutableString(),
            ]
        }
    }
        
        // 데이터 가져오기
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        tmpBook[element]?.append(string)
    }
        
        // 라이브러리들에 추가하기
    func parser(_ parser: XMLParser, didEndElement elementName: String,
                    namespaceURI: String?, qualifiedName qName: String?) {
        if (elementName as NSString).isEqual(to: "item") {
            for (key, value) in tmpBook {
                tmpBook[key] = value.replacingOccurrences(of: "</b>", with: "").replacingOccurrences(of: "<b>", with: "") as? NSMutableString
            }
            books.append(tmpBook)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}
