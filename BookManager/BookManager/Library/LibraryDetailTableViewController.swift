//
//  LibraryDetailTableViewController.swift
//  BookManager
//
//  Created by kpugame on 2020/06/05.
//  Copyright © 2020 kpugame. All rights reserved.
//

import UIKit

class LibraryDetailTableViewController: UITableViewController {
    
    var library = Library()
    var titles = [String]()
    var library_info = [String]()
    
    func set_library_info( ) {
        library_info.append(library.LIBRRY_NM)
        library_info.append(library.LIBRRY_TYPE_NM)
        library_info.append(library.CLOSE_DE_INFO)
        library_info.append(library.OPERT_BEGIN_TM + " ~ " + library.OPERT_END_TM)
        library_info.append(library.READ_SEAT_CNT)
        library_info.append(library.BOOK_DATA_CNT)
        library_info.append(library.HMPG_ADDR)
        library_info.append(library.REFINE_LOTNO_ADDR)
        library_info.append(library.REFINE_ROADNM_ADDR)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        titles = ["도서관 명", "도서관 유형", "휴무일", "평일 운영시간", "열람 좌석수", "자료수",
                  "홈페이지 주소", "지번 주소", "도로명 주소"]
        set_library_info()
        print(library_info)
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return library_info.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        

        if let title_label = cell.viewWithTag(1) as? UILabel{
            title_label.text = titles[indexPath.row]
        }
        if let contents_label = cell.viewWithTag(2) as? UILabel{
            contents_label.text = library_info[indexPath.row]
        }
        
        return cell
    }

}
