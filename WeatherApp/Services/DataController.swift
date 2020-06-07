//
//  DataController.swift
//  WeatherApp
//
//  Created by Anuranjan Bose on 07/06/20.
//  Copyright © 2020 Anuranjan Bose. All rights reserved.
//

import Foundation

protocol DataController {
    var apiKey: String { get }
    func getURL(city: String) -> URL
}

extension DataController {
    var apiKey: String {
        return "92b8f7ea336d0eb00a1dee60ad97da44"
    }
    
    func getURL(city: String) -> URL {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)") else {
            fatalError("Broken URL")
        }
        return url
    }
}
