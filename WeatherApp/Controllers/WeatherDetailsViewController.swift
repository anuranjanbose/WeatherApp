//
//  WeatherDetailsViewController.swift
//  WeatherApp
//
//  Created by Anuranjan Bose on 09/06/20.
//  Copyright © 2020 Anuranjan Bose. All rights reserved.
//

import Foundation
import UIKit

class WeatherDetailsViewController: UIViewController {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    var weatherViewModel: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let weatherVM = weatherViewModel {
            self.cityNameLabel.text = weatherVM.name
            self.currentTemperatureLabel.text = "\(weatherVM.currentTemperature.temperature)"
            self.maxTempLabel.text = "\(weatherVM.currentTemperature.temperatureMax)"
            self.minTempLabel.text = "\(weatherVM.currentTemperature.temperatureMin)"
        }
        
    }
}
