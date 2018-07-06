//
//  CurrentWeatherViewController.swift
//  Weather
//
//  Created by Amr Mohamed on 7/6/18.
//  Copyright © 2018 Mahmoud. All rights reserved.
//

import UIKit
import CoreLocation

class CurrentWeatherViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var cityTextLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var temperatureScale: UILabel!
    @IBOutlet weak var summary: UILabel!
    
    var locManager = CLLocationManager()
    
    
    //Testing Data
    let forcastAPIKey = "dfdc73ea0f4eaadfa92a00aba19216dc"
    var coordinate: (lat: Double , long: Double) = (37.8267,-122.4233)
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locManager.requestWhenInUseAuthorization()
        
        var currentLocation: CLLocation!
        if( CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() ==  .authorizedAlways){
            
            currentLocation = locManager.location
            print("(latitude: \(currentLocation.coordinate.latitude),lonitude: \(currentLocation.coordinate.longitude)")
            coordinate.lat = currentLocation.coordinate.latitude
            coordinate.long = currentLocation.coordinate.longitude
            
        }
        
        let forcastService = ForcastService(APIKey: forcastAPIKey)
        //print("(latitude: \(currentLocation.coordinate.latitude),lonitude: \(currentLocation.coordinate.longitude)")
//        forcastService.getForcast(latitude: currentLocation.coordinate.latitude, lonitude: currentLocation.coordinate.longitude) { (currentWeather) in
        forcastService.getForcast(latitude: coordinate.lat, lonitude: coordinate.long) { (currentWeather) in
            if let currentWeather = currentWeather{
                DispatchQueue.main.async {
                    
                    if let temperatureval = currentWeather.temperature {
                        self.temperatureLabel.text = "\(temperatureval)"
                    } else {
                        self.temperatureLabel.text = "-"
                    }
                    
                    if let summaryval = currentWeather.summary {
                        self.summary.text = "\(summaryval)"
                    } else {
                        self.summary.text = "-"
                    }
                    
                }
            }
        }
    }

}
