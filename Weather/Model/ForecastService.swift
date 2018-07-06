//
//  ForecastService.swift
//  Weather
//
//  Created by Amr Mohamed on 7/4/18.
//  Copyright © 2018 Mahmoud. All rights reserved.
//

import Foundation


class ForcastService{
    
    let forcastAPIKey: String
    let forcastBaseURL: URL?
    
    init(APIKey: String) {
        
        self.forcastAPIKey = APIKey
        forcastBaseURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)")
    }
    
    func getForcast(latitude: Double , lonitude: Double , completion: @escaping (CurrentWeather?) -> Void) {
        if let forcastURL = URL(string: "\(forcastBaseURL!)/\(latitude),\(lonitude)") {
            let networkProcessor = NetworkProcessor(url: forcastURL)
            networkProcessor.downloadJSONFromURL ({ (jsonDictionary) in
               
                if let currentWeatherDictionary = jsonDictionary?["currently"] as? [String: Any] {
                    let currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
                    completion(currentWeather)
                } else {
                        completion(nil)
                }
            })
            
        }
    }
    
    
}





















