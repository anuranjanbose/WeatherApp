//
//  AddWeatherCityViewController.swift
//  WeatherApp
//
//  Created by Anuranjan Bose on 07/06/20.
//  Copyright © 2020 Anuranjan Bose. All rights reserved.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController, DataController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipCodeTextField: UITextField!
    
    // MARK: - Public Properties
    var delegate: AddWeatherDelegate?
    
    // MARK: - IBActions
    @IBAction func saveCity() {
        if let city = cityNameTextField.text {
            let weatherURL = getURL(city: city)
            
            let weatherResource = Resource<WeatherViewModel>(url: weatherURL) { data in
                
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                return weatherVM
                
            }
            
            WebService().load(resource: weatherResource) {[weak self] result in
                if let weatherVM = result {
                    if let delegate = self?.delegate {
                        delegate.addWeatherDidSave(vm: weatherVM)
                        self?.dismiss(animated: true, completion: nil)
                        
                    }
                }
            }
            
        }
    }
    
    @IBAction func closeTheView() {
        self.dismiss(animated: true, completion: nil)
    }
}
