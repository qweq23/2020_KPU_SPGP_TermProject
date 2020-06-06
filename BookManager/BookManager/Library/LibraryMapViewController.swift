//
//  LibraryMapViewController.swift
//  BookManager
//
//  Created by kpugame on 2020/05/31.
//  Copyright © 2020 kpugame. All rights reserved.
//

import UIKit
import MapKit

class LibraryMapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 5000
    var spots = [LibraryOnMap]()
    var libraries = [Library]()
    
    func loadSpotsData() {
        for library in libraries {
            let name = library.LIBRRY_NM
            let addr = library.REFINE_ROADNM_ADDR
            let lat = (library.REFINE_WGS84_LAT as NSString).doubleValue
            let logt = (library.REFINE_WGS84_LOGT as NSString).doubleValue
            
            let librarySpot = LibraryOnMap(name: name, addr: addr, latitude: lat, longitude: logt)
            spots.append(librarySpot)
        }
    }
    
    func setCenterOfMap(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lat = (libraries[0].REFINE_WGS84_LAT as NSString).doubleValue
        let logt = (libraries[0].REFINE_WGS84_LOGT as NSString).doubleValue
        
        let initialLocation = CLLocation(latitude: lat, longitude: logt)
        
        setCenterOfMap(location: initialLocation)
        
        mapView.delegate = self
        loadSpotsData()
        mapView.addAnnotations(spots)
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        let location = view.annotation as! LibraryOnMap
        let launchOption = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        location.mapItem().openInMaps(launchOptions: launchOption)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? LibraryOnMap else { return nil }
        
        let identifier = "marker"
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: 5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
