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
    
    mutating func addWeatherViewModel(_ vm: WeatherViewModel) {
        self.weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return self.weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        return self.weatherViewModels[index]
    }
    
    mutating func updateUnit(to unit: Unit) {
        weatherViewModels = weatherViewModels.map { vm in
            var weatherModel = vm
            weatherModel.currentTemperature.temperature = convert(temperature: weatherModel.currentTemperature.temperature, to: unit)
            return weatherModel
        }
    }
    
    private func convert(temperature: Double, to unit: Unit) -> Double {
        switch unit {
        /// To Celsius
        case .celsius:
            return ((temperature - 32) * 5/9)
        /// To Fahrenheit
        case .fahrenheit:
            return ((temperature * 9/5) + 32)
        }
    }
}

struct WeatherViewModel: Decodable {
    
    var currentTemperature: TemperatureViewModel
    let name: String

    private enum CodingKeys: String, CodingKey {
        case name
        case currentTemperature = "main"
    }
}

struct TemperatureViewModel: Decodable {
    var temperature: Double
    let temperatureMin: Double
    let temperatureMax: Double
    
    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
}
