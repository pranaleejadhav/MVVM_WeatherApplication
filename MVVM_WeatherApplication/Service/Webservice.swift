//
//  Webservice.swift
//  MVVM_WeatherApplication
//
//  Created by Pranalee Jadhav on 12/18/18.
//  Copyright © 2018 Pranalee Jadhav. All rights reserved.
//

import Foundation

struct Resource<T> {
    var url: URL
    var decodedJSON: (Data) -> T?
}

struct Webservice {
    func load<T> (resource: Resource<T>, completion: @escaping (T?) -> ()){
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.decodedJSON(data))
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}
