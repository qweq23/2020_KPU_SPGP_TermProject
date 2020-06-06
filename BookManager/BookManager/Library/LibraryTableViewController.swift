//
//  LibraryTableViewController.swift
//  BookManager
//
//  Created by kpugame on 2020/05/31.
//  Copyright © 2020 kpugame. All rights reserved.
//

import UIKit

class LibraryTableViewController: UITableViewController, XMLParserDelegate {
    
    var parser = XMLParser()
    var search_area: String = ""
    var librarys : [Library] = []
    var element = NSString()

    var lib_name = NSMutableString()
    var lib_type = NSMutableString()
    var close_de = NSMutableString()
    var begin_tm = NSMutableString()
    var end_tm = NSMutableString()
    var seat_cnt = NSMutableString()
    var book_cnt = NSMutableString()
    var telno = NSMutableString()
    var hmpg_addr = NSMutableString()
    var num_addr = NSMutableString()
    var road_name_addr = NSMutableString()
    var logt = NSMutableString()
    var lat = NSMutableString()
    
    var url = "https://openapi.gg.go.kr/Library?KEY=4b8be84e2f8342d8a46f4cf8e07caf2b&SIGUN_NM="
    
    var cur_index = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 이 세그웨이가 해당 뷰 컨트롤러로 이동할 때 호출됨
        if segue.identifier == "LibraryDetail" {
            if let indexPath = tableView.indexPathForSelectedRow{
                let dst_controller = segue.destination as! LibraryDetailTableViewController
                dst_controller.library = librarys[indexPath.row]
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        beginParsing()
    }
    
    func beginParsing() {
        librarys.removeAll()
        
        url += search_area
        let encoded_url = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        parser = XMLParser(contentsOf: URL(string: encoded_url)!)!
        
        parser.delegate = self
        parser.parse()
    }
    
    // parser가 새로운 row를 발견했을 때
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        element = elementName as NSString
        
        if element.isEqual(to: "row") {
            lib_name = ""
            lib_type = ""
            close_de = ""
            begin_tm = ""
            end_tm = ""
            seat_cnt = ""
            book_cnt = ""
            telno = ""
            hmpg_addr = ""
            num_addr = ""
            road_name_addr = ""
            logt = ""
            lat = ""
        }
    }
    
    // 데이터 가져오기
    func parser(_ parser: XMLParser, foundCharacters string: String)
    {
        if element.isEqual(to: "LIBRRY_NM") {
            lib_name.append(string)
        } else if element.isEqual(to: "LIBRRY_TYPE_NM") {
            lib_type.append(string)
        } else if element.isEqual(to: "CLOSE_DE_INFO") {
            close_de.append(string)
        } else if element.isEqual(to: "OPERT_BEGIN_TM") {
            begin_tm.append(string)
        } else if element.isEqual(to: "OPERT_END_TM") {
            end_tm.append(string)
        } else if element.isEqual(to: "READ_SEAT_CNT") {
            seat_cnt.append(string)
        } else if element.isEqual(to: "BOOK_DATA_CNT") {
            book_cnt.append(string)
        } else if element.isEqual(to: "LIBRRY_TELNO") {
            telno.append(string)
        } else if element.isEqual(to: "HMPG_ADDR") {
            hmpg_addr.append(string)
        } else if element.isEqual(to: "REFINE_LOTNO_ADDR") {
            num_addr.append(string)
        } else if element.isEqual(to: "REFINE_ROADNM_ADDR") {
            road_name_addr.append(string)
        } else if element.isEqual(to: "REFINE_WGS84_LOGT") {
            logt.append(string)
        } else if element.isEqual(to: "REFINE_WGS84_LAT") {
            lat.append(string)
        }
    }
    
    // 라이브러리들에 추가하기
    func parser(_ parser: XMLParser, didEndElement elementName: String,
                namespaceURI: String?, qualifiedName qName: String?) {

        if (elementName as NSString).isEqual(to: "row") {

            let library = Library(
                librry_nm: (lib_name as String).trimmingCharacters(in: .whitespacesAndNewlines),
                libtype: (lib_type as String).trimmingCharacters(in: .whitespacesAndNewlines),
                close_de: (close_de as String).trimmingCharacters(in: .whitespacesAndNewlines),
                open_tm: (begin_tm as String).trimmingCharacters(in: .whitespacesAndNewlines),
                end_tm: (end_tm as String).trimmingCharacters(in: .whitespacesAndNewlines),
                seat_cnt: (seat_cnt as String).trimmingCharacters(in: .whitespacesAndNewlines),
                book_cnt: (book_cnt as String).trimmingCharacters(in: .whitespacesAndNewlines),
                telno: (telno as String).trimmingCharacters(in: .whitespacesAndNewlines),
                hmpg_addr: (hmpg_addr as String).trimmingCharacters(in: .whitespacesAndNewlines),
                lotno_addr: (num_addr as String).trimmingCharacters(in: .whitespacesAndNewlines),
                roadnm_addr: (road_name_addr as String).trimmingCharacters(in: .whitespacesAndNewlines),
                lat: (lat as String).trimmingCharacters(in: .whitespacesAndNewlines),
                logt: (logt as String).trimmingCharacters(in: .whitespacesAndNewlines)
            )
            
            librarys.append(library)

        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return librarys.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "libraryCell", for: indexPath)
        
        cell.textLabel?.text = librarys[indexPath.row].LIBRRY_NM
        cell.detailTextLabel?.text = librarys[indexPath.row].REFINE_ROADNM_ADDR

        return cell
    }

}
