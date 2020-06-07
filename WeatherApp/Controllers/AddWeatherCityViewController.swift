//
//  AddWeatherCityViewController.swift
//  WeatherApp
//
//  Created by Anuranjan Bose on 07/06/20.
//  Copyright © 2020 Anuranjan Bose. All rights reserved.
//

import Foundation
import UIKit

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBAction func saveCity() {
        
    }
    
    @IBAction func closeTheView() {
        self.dismiss(animated: true, completion: nil)
    }
}
