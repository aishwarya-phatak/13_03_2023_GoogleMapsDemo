//
//  ViewController.swift
//  13_03_2023_GoogleMapsDemo
//
//  Created by Vishal Jagtap on 22/05/23.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    var marker : GMSMarker = GMSMarker()
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        initializeMapSettings()
        let cameraPostion = GMSCameraPosition(latitude: 18.5091, longitude: 73.8326, zoom: 20.0)
        GMSCameraUpdate.setTarget(cameraPostion.target)
        showMarker(position: cameraPostion.target)
      }
    
    func showMarker(position : CLLocationCoordinate2D){
        marker.position = position
        marker.snippet = "Bitcode"
        marker.title = "This is Bitcode"
        marker.layer.backgroundColor = .init(red: 200.0, green: 0.0, blue: 0.0, alpha: 4.0)
        marker.isDraggable = true
        marker.rotation = 45.0
        marker.zIndex = 10
        marker.map = mapView
    }
    
    func initializeMapSettings(){
        mapView.settings.compassButton = true
        mapView.settings.zoomGestures = true
        mapView.settings.myLocationButton = true
        mapView.settings.rotateGestures = true
        mapView.isMyLocationEnabled = true
        mapView.isTrafficEnabled = true
        mapView.isBuildingsEnabled = true
        mapView.mapType = GMSMapViewType.normal
    }
}


extension ViewController : GMSMapViewDelegate{
    func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
        print("Lat :\(marker.position.latitude) - Long :\(marker.position.longitude)")
    }
    
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        print("Lat :\(marker.position.latitude) - Long :\(marker.position.longitude)")
    }
    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
       let infoWindow = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        infoWindow.backgroundColor = UIColor.red
        infoWindow.alpha = 2.0
        infoWindow.layer.borderColor = CGColor(red: 100.0, green: 0.0, blue: 100.0, alpha: 6.0)
        infoWindow.layer.borderWidth = 2.0
        
        let infoLabel = UIView(frame: CGRect(x: 10, y: 10, width: Int(infoWindow.frame.width - 50), height: 40))
        infoLabel.backgroundColor = UIColor.init(red: 0.0, green: 10.0, blue: 90.0, alpha: 6.0)
        infoLabel.layer.borderColor = CGColor(red: 0.0, green: 0.0, blue: 200.0, alpha: 20.0)
        infoLabel.layer.borderWidth = 2.0
        infoWindow.addSubview(infoLabel)
        
//        let secondInfoLabel = UIView(frame: CGRect(x: 10, y: 60, width: infoLabel.frame.width, height: 35))
        let secondInfoLabel = UIView(frame: CGRect(x: infoLabel.frame.minX, y:infoLabel.frame.height + 10, width: infoLabel.frame.width, height: 35))
        
        secondInfoLabel.backgroundColor = .brown
        secondInfoLabel.alpha = 2.0
        secondInfoLabel.layer.borderColor = CGColor(red: 0.0, green: 0.0, blue: 100.0, alpha: 4.0)
        secondInfoLabel.layer.borderWidth = 2.0
        infoWindow.addSubview(secondInfoLabel)
        
        return infoWindow
    }
    
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        print("Lat :\(marker.position.latitude) - Long :\(marker.position.longitude)")
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("Lat :\(coordinate.latitude) - Long :\(coordinate.longitude)")
    }
}
