//
//  File.swift
//  EERouter
//
//  Created by Shakhmar Sarsenbay on 12.03.2018.
//  Copyright © 2018 Shakhmar Sarsenbay. All rights reserved.
//

import UIKit
import CoreMotion
import CoreLocation

class ViewController1: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a ni
            
            
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.delegate = self
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
            startLocation = nil
    }
    
    var locationManager: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
   
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation])
    {
        let latestLocation: CLLocation = locations[locations.count - 1]
        
        latitude.text = String(format: "%.4f",
                               latestLocation.coordinate.latitude)
        longitude.text = String(format: "%.4f",
                                latestLocation.coordinate.longitude)
        
        
    }
    func locationManager(_ manager: CLLocationManager,
                         didFailWithError error: Error) {
        
    }
}
