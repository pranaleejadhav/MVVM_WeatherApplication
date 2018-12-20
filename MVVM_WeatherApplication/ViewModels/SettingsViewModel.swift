//
//  SettingsViewModel.swift
//  MVVM_WeatherApplication
//
//  Created by Pranalee Jadhav on 12/18/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import Foundation


enum Unit: String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    var displayText: String {
        get {
            switch(self) {
                case .celsius:
                    return "Celsius"
                case .fahrenheit:
                    return "Fahrenheit"
            }
        }
    }
}

struct SettingsViewModel {
    let units = Unit.allCases
    private var defaultValue = Unit.fahrenheit
    
    var selectedUnit: Unit {
        get {
            let userDefaults = UserDefaults.standard
            if let value = userDefaults.value(forKey: "unit") as? String {
                print("raw value \(Unit(rawValue: value)!)")
                return Unit(rawValue: value)!
            }
            return defaultValue
        }
        set {
            
            let userDefaults = UserDefaults.standard
            userDefaults.set(newValue.rawValue, forKey: "unit")
        }
    }
}


