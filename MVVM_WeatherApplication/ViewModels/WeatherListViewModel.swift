//
//  WeatherListViewModel.swift
//  MVVM_WeatherApplication
//
//  Created by Pranalee Jadhav on 12/18/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import Foundation

class WeatherListViewModel {
    private var weatherViewModels = [WeatherViewModel]()
    
    func addWeatherViewModel(_ vm: WeatherViewModel) {
        weatherViewModels.append(vm)
    }
    
    func weatherViewModelAt(_ index: Int) -> WeatherViewModel {
        return weatherViewModels[index]
    }
    
    func numberOfRows(_ section: Int) -> Int {
        return weatherViewModels.count
    }
    
    func toCelsius() {
        weatherViewModels = weatherViewModels.map { vm in
            var weatherModel = vm
            weatherModel.temperatureDetails.temperature = (weatherModel.temperatureDetails.temperature - 32) * 5/9
            return weatherModel
        }
    }
    
    func toFahrenheit() {
        weatherViewModels = weatherViewModels.map { vm in
            var weatherModel = vm
            weatherModel.temperatureDetails.temperature = (weatherModel.temperatureDetails.temperature * 9/5) + 32
            return weatherModel
        }
    }
    
    func updateUnit(to unit: Unit) {
        switch unit {
            case .celsius: toCelsius()
            case .fahrenheit: toFahrenheit()
        }
    }
    
}

struct WeatherViewModel: Decodable {
    let name: String
    var temperatureDetails: TemperatureViewModel
    
    private enum CodingKeys: String, CodingKey {
        case name
        case temperatureDetails = "main"
    }
}

struct TemperatureViewModel: Decodable {
    var temperature: Double
    let temperatureMax: Double
    let temperatureMin: Double
    
    private enum CodingKeys: String, CodingKey {
        case temperature = "temp"
        case temperatureMax = "temp_max"
        case temperatureMin = "temp_min"
    }
    
    
}
