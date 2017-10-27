//
//  AerisDataManager.swift
//  WTW
//
//  Created by Cameron Flowers on 10/25/17.
//  Copyright © 2017 floreo. All rights reserved.
//

import Foundation
import UIKit

private final class AerisDevKey {
    static let accessID = "7vI3jHK7hBLlCiDjQAbyz"
    static let secretKey = "evQjJbu1bvpmBGEyPxYl7Mg4ft0oLZuYBdo6ghDI"
}

struct ForecastObject : Codable {
    let date: String
    let maxTempF: Int
    let maxTempC: Int
    let minTempF: Int
    let minTempC: Int
    let icon: String

    enum CodingKeys : String, CodingKey {
        case date = "dateTimeISO"
        case maxTempF = "maxTempF"
        case maxTempC = "maxTempC"
        case minTempF = "minTempF"
        case minTempC = "minTempC"
        case icon = "icon"
    }
}
    struct Forecast : Codable {
        let periods: [ForecastObject]
    }

    struct Response : Codable {
        let response: [Forecast]
    }


protocol AerisDataModelDelegate {
    func onDataReturn(data: [ForecastObject]) -> Void
}

class AerisDataManager: NSObject {

 var delegate:AerisDataModelDelegate?
    

  let endpoint = "https://api.aerisapi.com/forecasts/newyork,ny?client_id=\(AerisDevKey.accessID)&client_secret=\(AerisDevKey.secretKey)"

    func getWeatherData() {

            let task = URLSession.shared.dataTask(with: URL(string: endpoint)!){ (data, response, error) in
                do {
                    guard let data = data else {
                        print ("AerisClient received no data")
                        return
                    }
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Response.self, from: data)
                    let periods = response.response.first
                    dump(response.response)
                    var forecast: [ForecastObject] = []
                    for period : ForecastObject in (periods?.periods)! {

                        let isoDate = period.date
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                        let date = dateFormatter.date(from: isoDate)
                        dateFormatter.dateFormat = "EEEE, MMM dd"
                        let formattedDate =  dateFormatter.string(from: date!)

                    var newObject = ForecastObject.init(date: formattedDate,
                                                        maxTempF: period.maxTempF,
                                                        maxTempC: period.maxTempC,
                                                        minTempF: period.minTempF,
                                                        minTempC: period.minTempC,
                                                        icon: period.icon)
                        forecast.append(newObject)
                        print("\(forecast.count)")

                    }
                    self.delegate?.onDataReturn(data: forecast)
                }
                catch {
                    print(error)
                }
            }
            task.resume()
        }
}

