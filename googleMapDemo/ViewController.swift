//
//  ViewController.swift
//  googleMapDemo
//
//  Created by Guri Saini on 22/06/22.
//

import UIKit
import GoogleMaps
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet fileprivate weak var mapView: GMSMapView!
    

    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude:30.713329, longitude: 76.695566, zoom: 6.0)
        mapView.camera = camera
        showMarker(position: camera.target)
       // mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)

        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
       
      
    
    func showMarker(position: CLLocationCoordinate2D){
        let marker = GMSMarker()
        marker.position = position
        marker.title = "Location"
        marker.snippet = "Mohali"
        marker.map = mapView
    }
    }}
extension ViewController: GMSMapViewDelegate{
    func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
        print("didBeginDragging")
    }
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        print("didDrag")
    }
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        print("didEndDragging")
    }
    
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        let userLocation = locations.last
              let center = CLLocationCoordinate2D(latitude: locValue.latitude, longitude: locValue.longitude)

              let camera = GMSCameraPosition.camera(withLatitude: locValue.longitude,
                                                                longitude: locValue.longitude, zoom: 13.0)
              mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
              mapView.isMyLocationEnabled = true
              self.view = mapView

              locationManager.stopUpdatingLocation()
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
   
}
