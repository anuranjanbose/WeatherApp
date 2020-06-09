//
//  TableViewDataSource.swift
//  WeatherApp
//
//  Created by Anuranjan Bose on 10/06/20.
//  Copyright © 2020 Anuranjan Bose. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource<CellType, ViewModel>: NSObject, UITableViewDataSource where CellType: UITableViewCell {
    
    let cellIdentifier: String
    var items: [ViewModel]
    let configureCell: (CellType, ViewModel) -> Void
    
    init(cellIdentifier: String, items: [ViewModel], configureCell: @escaping (CellType, ViewModel) -> Void) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    func updateItems(_ items: [ViewModel]) {
        self.items = items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? CellType else {
            fatalError("\(self.cellIdentifier) not found")
        }
        let vm = self.items[indexPath.row]
        self.configureCell(cell, vm)
        return cell
    }
    
}
