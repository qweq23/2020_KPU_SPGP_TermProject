//
//  Library.swift
//  BookManager
//
//  Created by kpugame on 2020/05/31.
//  Copyright © 2020 kpugame. All rights reserved.
//

import Foundation

class Library {
    var SIGUN_NM: String
    var LIBRRY_NM: String
    var HMPG_ADDR: String
    var REFINE_LOTNO_ADDR: String           // 지번 주소
    var REFINE_ROADNM_ADDR: String          // 도로명 주소
    var RECSROOM_OPEN_TM_INFO: String       // 자료실 개방 시간
    var RECSROOM_REST_DE_INFO: String       // 자료실 휴무일
    var DMSTC_BOOK_DATA_CNT: String         // 국내도서 자료수
    var REFINE_WGS84_LAT: String            // 위도
    var REFINE_WGS84_LOGT: String           // 경도
    
    init (sigun_nm: String = "", librry_nm: String = "", hmpg_addr: String = "",
          lotno_addr: String = "", roadnm_addr: String = "", open_tm: String = "", rest_de: String = "",
          book_cnt: String = "", lat: String = "", logt: String = "") {
        self.SIGUN_NM = sigun_nm
        self.LIBRRY_NM = librry_nm
        self.HMPG_ADDR = hmpg_addr
        self.REFINE_LOTNO_ADDR = lotno_addr
        self.REFINE_ROADNM_ADDR = roadnm_addr
        self.RECSROOM_OPEN_TM_INFO = open_tm
        self.RECSROOM_REST_DE_INFO = rest_de
        self.DMSTC_BOOK_DATA_CNT = book_cnt
        self.REFINE_WGS84_LAT = lat
        self.REFINE_WGS84_LOGT = logt
    }
    
    // for test
    init (librry_nm: String) {
        self.SIGUN_NM = ""
        self.LIBRRY_NM = librry_nm
        self.HMPG_ADDR = ""
        self.REFINE_LOTNO_ADDR = ""
        self.REFINE_ROADNM_ADDR = ""
        self.RECSROOM_OPEN_TM_INFO = ""
        self.RECSROOM_REST_DE_INFO = ""
        self.DMSTC_BOOK_DATA_CNT = ""
        self.REFINE_WGS84_LAT = ""
        self.REFINE_WGS84_LOGT = ""
    }
    
    init () {
        self.SIGUN_NM = ""
        self.LIBRRY_NM = ""
        self.HMPG_ADDR = ""
        self.REFINE_LOTNO_ADDR = ""
        self.REFINE_ROADNM_ADDR = ""
        self.RECSROOM_OPEN_TM_INFO = ""
        self.RECSROOM_REST_DE_INFO = ""
        self.DMSTC_BOOK_DATA_CNT = ""
        self.REFINE_WGS84_LAT = ""
        self.REFINE_WGS84_LOGT = ""
    }
}
