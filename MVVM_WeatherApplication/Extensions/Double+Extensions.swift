//
//  Double+Extensions.swift
//  MVVM_WeatherApplication
//
//  Created by Pranalee Jadhav on 12/18/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import Foundation

extension Double {
    
    var parseAsDegree : String {
        return String(format: "%.0fº", self)
    }
    
}
