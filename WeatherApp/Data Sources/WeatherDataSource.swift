//
//  WeatherDataSource.swift
//  WeatherApp
//
//  Created by Anuranjan Bose on 09/06/20.
//  Copyright © 2020 Anuranjan Bose. All rights reserved.
//

import Foundation
import UIKit

class WeatherDataSource: NSObject, UITableViewDataSource {
    
    let cellIdentifier: String = "WeatherCell"
    private var weatherListViewModel: WeatherListViewModel
    
    init(weatherListViewModel: WeatherListViewModel) {
        self.weatherListViewModel = weatherListViewModel
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListViewModel.weatherViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? WeatherCell else {
            fatalError("\(cellIdentifier) not found")
        }
        
        let weatherVM = self.weatherListViewModel.modelAt(indexPath.row)
        cell.cityNameLabel.text = weatherVM.name.value
        cell.temperatureLabel.text = weatherVM.currentTemperature.temperature.value.formatAsDegree
        return cell
        
    }

}
