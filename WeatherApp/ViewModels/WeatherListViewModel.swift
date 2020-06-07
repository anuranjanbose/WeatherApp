//
//  WeatherListViewModel.swift
//  WeatherApp
//
//  Created by Anuranjan Bose on 07/06/20.
//  Copyright © 2020 Anuranjan Bose. All rights reserved.
//

import Foundation

struct WeatherListViewModel {
    
    private var weatherViewModels = [WeatherViewModel]()
}

struct WeatherViewModel: Decodable {
    
    let currentTemperature: TemperatureViewModel
    let name: String

    private enum CodingKeys: String, CodingKey {
        case name
        case currentTemperature = "main"
    }
}

struct TemperatureViewModel: Decodable {
    let temperature: Double
    let temperatureMin: Double
    let temperatureMax: Double
    
    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
}
