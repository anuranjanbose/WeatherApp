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
    
    let main: TemperatureViewModel
    let name: String

}

struct TemperatureViewModel: Decodable {
    let temp: Double
    let temp_min: Double
    let temp_max: Double
}
