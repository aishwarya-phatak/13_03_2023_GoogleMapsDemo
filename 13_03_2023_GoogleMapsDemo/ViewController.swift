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
        //mapView.delegate = self
        initializeMapSettings()
        let cameraPostion = GMSCameraPosition(latitude: 27.1751, longitude: 78.0421, zoom: 20.0)
        mapView.camera = cameraPostion
        GMSCameraUpdate.setTarget(cameraPostion.target)
        showMarker(position: cameraPostion.target)

        
        drawPolygonOnMap()
        drawPolylineOnMap()
        drawCircleOnMap()
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
        
        let infoLabel = UILabel(frame: CGRect(x: 10, y: 10, width: Int(infoWindow.frame.width - 50), height: 40))
        infoLabel.backgroundColor = UIColor.init(red: 0.0, green: 10.0, blue: 90.0, alpha: 6.0)
        infoLabel.layer.borderColor = CGColor(red: 0.0, green: 0.0, blue: 200.0, alpha: 20.0)
        infoLabel.layer.borderWidth = 2.0
        infoLabel.text = "Bitcode"
        infoWindow.addSubview(infoLabel)
        
//        let secondInfoLabel = UIView(frame: CGRect(x: 10, y: 60, width: infoLabel.frame.width, height: 35))
        let secondInfoLabel = UILabel(frame: CGRect(x: infoLabel.frame.minX, y:infoLabel.frame.height + 10, width: infoLabel.frame.width, height: 35))
        
        secondInfoLabel.backgroundColor = .brown
        secondInfoLabel.alpha = 2.0
        secondInfoLabel.layer.borderColor = CGColor(red: 0.0, green: 0.0, blue: 100.0, alpha: 4.0)
        secondInfoLabel.layer.borderWidth = 2.0
        secondInfoLabel.text = "Software Training"
        infoWindow.addSubview(secondInfoLabel)
        
        return infoWindow
    }
    
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        print("Lat :\(marker.position.latitude) - Long :\(marker.position.longitude)")
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("Lat :\(coordinate.latitude) - Long :\(coordinate.longitude)")
    }
    
    func drawPolygonOnMap(){
       let polygonPath = GMSMutablePath()
        polygonPath.add(CLLocationCoordinate2D(latitude: 19.7515, longitude: 75.7139))
        polygonPath.add(CLLocationCoordinate2D(latitude: 22.6708, longitude: 71.5724))
        polygonPath.add(CLLocationCoordinate2D(latitude: 27.0238, longitude: 74.2179))
        polygonPath.add(CLLocationCoordinate2D(latitude: 22.9734, longitude: 78.6569))
        
       let polygon = GMSPolygon(path: polygonPath)
        polygon.fillColor = .brown
        polygon.layer.opacity = 3.0
        polygon.strokeColor = .white
        polygon.strokeWidth = 3.0
        polygon.map = mapView
    }
    
    func drawPolylineOnMap(){
       let polyLinePath = GMSMutablePath()
        polyLinePath.add(CLLocationCoordinate2D(latitude: 18.5204, longitude: 73.8567))
        polyLinePath.addLatitude(19.10107, longitude: 74.74067)
        polyLinePath.add(CLLocationCoordinate2D(latitude: 17.659920, longitude: 75.90638))
        polyLinePath.add(CLLocationCoordinate2D(latitude: 17.691401, longitude: 74.000938))
        polyLinePath.add(CLLocationCoordinate2D(latitude: 18.5204, longitude: 73.8567))
       let polyLine = GMSPolyline(path: polyLinePath)
        polyLine.strokeWidth = 3.0
        polyLine.strokeColor = .red
        polyLine.zIndex = 90
        polyLine.map = mapView
    }

    func drawCircleOnMap(){
       let circle = GMSCircle(position: CLLocationCoordinate2D(latitude: 27.1751, longitude: 78.0421), radius: 20.0)
        circle.strokeColor = .black
        circle.strokeWidth = 5.0
        circle.fillColor = .brown
        circle.zIndex = 40
        circle.map = mapView
        circle.map?.layer.opacity = 2.0
    }
}
