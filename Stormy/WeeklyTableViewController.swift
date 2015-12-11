//
//  WeeklyTableTableViewController.swift
//  Stormy
//
//  Created by Smashing Boxes on 12/11/15.
//  Copyright © 2015 Treehouse. All rights reserved.
//

import UIKit

class WeeklyTableViewController: UITableViewController {
  @IBOutlet weak var currentTemperatureLabel: UILabel?
  @IBOutlet weak var currentWeatherIcon: UIImageView?
  @IBOutlet weak var currentPrecipitationLabel: UILabel?
  @IBOutlet weak var currentTemperatureRangeLabel: UILabel?
  
  // Location coordinates
  let coordinate: (lat: Double, lon: Double) = (37.8267,-122.423)
  
  // TODO: Enter your API key here
  private let forecastAPIKey = "5bebb3aedac2cd0f3588d64a9c8fdbfe"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
    retrieveWeatherForecast()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func configureView() {
    // Set table view's background view property
    tableView.backgroundView = BackgroundView()
    
    // Change the font and size of navbar text
    if let navBarFont = UIFont(name: "HelveticaNeue-Thin", size: 20.0) {
      let navBarAttributesDictionary: [String: AnyObject]? = [
        NSForegroundColorAttributeName: UIColor.whiteColor(),
        NSFontAttributeName: navBarFont
      ]
      navigationController?.navigationBar.titleTextAttributes = navBarAttributesDictionary
    }
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 0
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return 0
  }
  
  // MARK: - Weather Fetching
  
  func retrieveWeatherForecast() {
    let forecastService = ForecastService(APIKey: forecastAPIKey)
    forecastService.getForecast(coordinate.lat, lon: coordinate.lon) {
      (let currently) in
      if let currentWeather = currently {
        dispatch_async(dispatch_get_main_queue()) {
          if let temperature = currentWeather.temperature {
            self.currentTemperatureLabel?.text = "\(temperature)º"
          }
          
          if let precipitation = currentWeather.precipProbability {
            self.currentPrecipitationLabel?.text = "Rain: \(precipitation)%"
          }
          
          if let icon = currentWeather.icon {
            self.currentWeatherIcon?.image = icon
          }
          
        }
      }
    }
  }
  
}
