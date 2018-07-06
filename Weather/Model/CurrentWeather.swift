//
//  CurrentWeather.swift
//  Weather
//
//  Created by Amr Mohamed on 7/4/18.
//  Copyright © 2018 Mahmoud. All rights reserved.
//

import Foundation
class CurrentWeather {
    struct WeatherKeys {
        static let temperature = "temperature"
        static let humidity = "humidity"
        static let precipProbability = "precipProbability"
        static let summary = "summary"
    }
    let temperature: Int?
    let humidity: Int?
    let precipProbability: Int?
    let summary: String?
    init(weatherDictionary: [String: Any]) {
        
        if let tempDouble  = weatherDictionary[WeatherKeys.temperature] as? Double {
            temperature = Int((tempDouble - 32) * 5/9)
        } else {
            temperature = nil
        }
        
        if let humidityDouble  = weatherDictionary[WeatherKeys.humidity] as? Double {
            humidity = Int(humidityDouble * 100)
        } else {
            humidity = nil
        }
        
        if let precipDouble = weatherDictionary[WeatherKeys.precipProbability] as? Double {
            precipProbability = Int(precipDouble * 100)
        } else {
            precipProbability = nil
        }
        
        summary = weatherDictionary[WeatherKeys.summary] as? String        
    }
    /*
     {
     time: 1530699026,
     summary: "Partly Cloudy",
     icon: "partly-cloudy-night",
     nearestStormDistance: 300,
     nearestStormBearing: 155,
     precipIntensity: 0,
     precipProbability: 0,
     temperature: 56.05,
     apparentTemperature: 56.05,
     dewPoint: 51.13,
     humidity: 0.84,
     pressure: 1012.17,
     windSpeed: 8.3,
     windGust: 11.37,
     windBearing: 228,
     cloudCover: 0.53,
     uvIndex: 0,
     visibility: 9.51,
     ozone: 317
     }
     */
    
    
    
}
