//
//  WTWViewController.swift
//  WTW
//
//  Created by Cameron Flowers on 10/25/17.
//  Copyright © 2017 floreo. All rights reserved.
//
// Goals:
//        Verify that you are able to obtain a JSON response from the API, and familiarize yourself with the JSON results. You will need the minTempF and maxTempF fields for low and high temperatures, and dateTimeISO field for the forecast date. DONE
//
//        Write code to retrieve the weather forecast with an HTTP GET request, and parse the JSON response it returns. DONE
//
//        Write an app that shows forecasted low and high temperatures for each day in the forecast. Note the a single API call will retrieve all of this information. DONE
//
//        Create a GitHub repo and commit your app to it.
//
//        A set of weather icons is available as zip file in this repo. Each forecast includes an icon field, which names an icon from this collection. For each day, show the icon corresponding to the forecast weather. DONE
//
//        Add an interactive control to toggle between Farenheit and Celcius temperatures. DONE


import UIKit

class WTWViewController: UIViewController, AerisDataModelDelegate, UITableViewDataSource, UITableViewDelegate {


    func onDataReturn(data: [ForecastObject]) {
        forecasts = data
        wtwTableView.reloadData()
    }

    let dataManager = AerisDataManager()
    var forecasts : [ForecastObject]?
    var shouldShowCelsius = false

    @IBOutlet weak var wtwTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        dataManager.getWeatherData()
        dataManager.delegate = self
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if forecasts != nil {
            return forecasts!.count
        }
            return 1
        }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WTWCell") as! WTWTableViewCell

        if forecasts != nil {
            let myForecast = forecasts![indexPath.row]
            var tempHI = myForecast.maxTempF
            var tempLO = myForecast.minTempF

            if (shouldShowCelsius){
                tempHI = myForecast.maxTempC
                tempLO = myForecast.minTempC
            }

            cell.highLabel?.text = "High: \(tempHI)"
            cell.lowLabel?.text = "Low: \(tempLO)"
            cell.dateLabel?.text = myForecast.date
            cell.imageView?.image = UIImage.init(named: myForecast.icon)
            //customize cell to show date and icon later
            return cell
        }
            return cell
        }


    @IBAction func onDegreeTypeChanged(_ sender: UISegmentedControl) {

        switch sender.selectedSegmentIndex {
        case 1:
            shouldShowCelsius = true
        default:
            shouldShowCelsius = false
        }

        wtwTableView.reloadData()
    }
}


