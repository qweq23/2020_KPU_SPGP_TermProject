//
//  LibraryOnMap.swift
//  BookManager
//
//  Created by kpugame on 2020/06/06.
//  Copyright © 2020 kpugame. All rights reserved.
//

import Foundation
import MapKit
import Contacts

class LibraryOnMap: NSObject, MKAnnotation {
    let title: String?
    let addr: String
    let coordinate: CLLocationCoordinate2D
    
    init(name: String, addr: String, latitude lat: Double, longitude lon: Double) {
        self.title = name
        self.addr = addr
        self.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        
        super.init()
    }
    var subtitle: String? {
        return addr
    }
    
    func mapItem() -> MKMapItem {
        let addressDict = [CNPostalAddressStreetKey: subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
}
