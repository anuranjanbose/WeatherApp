//
//  AddWeatherCityViewController.swift
//  WeatherApp
//
//  Created by Anuranjan Bose on 07/06/20.
//  Copyright © 2020 Anuranjan Bose. All rights reserved.
//

import Foundation
import UIKit

class AddWeatherCityViewController: UIViewController, DataController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBAction func saveCity() {
        if let city = cityNameTextField.text {
            let weatherURL = getURL(city: city)
            
            let weatherResource = Resource<WeatherViewModel>(url: weatherURL) { data in
                
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                return weatherVM
                
            }
            
            WebService().load(resource: weatherResource) { result in
                
            }
            
        }
    }
    
    @IBAction func closeTheView() {
        self.dismiss(animated: true, completion: nil)
    }
}
