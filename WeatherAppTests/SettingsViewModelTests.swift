//
//  SettingsViewModelTests.swift
//  WeatherAppTests
//
//  Created by Anuranjan Bose on 10/06/20.
//  Copyright © 2020 Anuranjan Bose. All rights reserved.
//

import XCTest
@testable import WeatherApp

class SettingsViewModelTests: XCTestCase {

    private var settingsVM: SettingsViewModel!
    
    override func setUp() {
        super.setUp()
        self.settingsVM = SettingsViewModel()
    }
    
    func test_should_return_correct_display_name_for_fahrenheit() {
        XCTAssertEqual(Unit.fahrenheit.displayName, "Fahrenheit")
    }
    
    func test_should_make_sure_that_selected_unit_is_fahrenheit() {
        XCTAssertEqual(settingsVM.selectedUnit, .fahrenheit)
    }
    
    func test_should_be_able_to_save_units_to_user_defaults() {
        self.settingsVM.selectedUnit = .celsius
        let userDefaults = UserDefaults.standard
        XCTAssertNotNil(userDefaults.value(forKey: "unit"))
    }

    override class func tearDown() {
        super.tearDown()
        
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "unit")
    }
}
