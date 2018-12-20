//
//  AddCityViewController.swift
//  MVVM_WeatherApplication
//
//  Created by Pranalee Jadhav on 12/11/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import UIKit

protocol NewWeatherUpdate {
    func newWeatherAdded(vm: WeatherViewModel)
}

class AddCityViewController: UIViewController {

    @IBOutlet weak var cityName: UITextField!
    
    var delegate: NewWeatherUpdate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    @IBAction func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save() {
        
        if let city = cityName.text {
            //let weatherApiUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=8223dffc0ace6eed0212707e6173d271r&units=imperial")!
            let selectedUnit = SettingsViewModel().selectedUnit.rawValue
           
            let weatherApiUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=7d2dd8c9c5578b741c7735ad3f0d39ea&units=\(selectedUnit)")!
            
            
            let weatherResource = Resource<WeatherViewModel>(url: weatherApiUrl) { data in
                let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from: data)
                return weatherVM
            }
            
            Webservice().load(resource: weatherResource) { [weak self] result in
                if let weatherVM = result {
                    if let delegate = self?.delegate {
                        delegate.newWeatherAdded(vm: weatherVM)
                        self?.dismiss(animated: true, completion: nil)
                    }
                }
            }
            
            
        }
        
    }

}
