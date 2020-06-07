//
//  SettingsViewModel.swift
//  WeatherApp
//
//  Created by Anuranjan Bose on 07/06/20.
//  Copyright © 2020 Anuranjan Bose. All rights reserved.
//

import Foundation

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    var displayName: String {
        switch self {
        case .celsius:
            return "Celsius"
        case .fahrenheit:
            return "Fahrenheit"
        }
    }
}

struct SettingsViewModel {
    
    let units = Unit.allCases
}
