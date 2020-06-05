//
//  Library.swift
//  BookManager
//
//  Created by kpugame on 2020/05/31.
//  Copyright © 2020 kpugame. All rights reserved.
//

import Foundation

class Library {
    var LIBRRY_NM: String
    var LIBRRY_TYPE_NM: String
    var CLOSE_DE_INFO: String
    var OPERT_BEGIN_TM: String
    var OPERT_END_TM: String       // 자료실 개방 시간
    var READ_SEAT_CNT: String       // 자료실 휴무일
    var BOOK_DATA_CNT: String         // 국내도서 자료수
    var LIBRRY_TELNO: String
    var HMPG_ADDR: String
    var REFINE_LOTNO_ADDR: String           // 지번 주소
    var REFINE_ROADNM_ADDR: String          // 도로명 주소
    var REFINE_WGS84_LAT: String            // 위도
    var REFINE_WGS84_LOGT: String           // 경도
    
    init (
        librry_nm: String = "",
        libtype: String = "",
        close_de: String = "",
        open_tm: String = "",
        end_tm: String = "",
        seat_cnt: String = "",
        book_cnt: String = "",
        telno: String = "",
        hmpg_addr: String = "",
        lotno_addr: String = "",
        roadnm_addr: String = "",
        lat: String = "",
        logt: String = "")
    {
        self.LIBRRY_NM = librry_nm
        self.LIBRRY_TYPE_NM = librry_nm
        self.CLOSE_DE_INFO = librry_nm
        self.OPERT_BEGIN_TM = librry_nm
        self.OPERT_END_TM = librry_nm
        self.READ_SEAT_CNT = librry_nm
        self.BOOK_DATA_CNT = librry_nm
        self.LIBRRY_TELNO = librry_nm
        self.HMPG_ADDR = hmpg_addr
        self.REFINE_LOTNO_ADDR = lotno_addr
        self.REFINE_ROADNM_ADDR = roadnm_addr
        self.REFINE_WGS84_LAT = lat
        self.REFINE_WGS84_LOGT = logt
    }
    
}
