//
//  Forecast.swift
//  Stormy
//
//  Created by Ian Donovan on 12/12/15.
//  Copyright © 2015 Treehouse. All rights reserved.
//

import Foundation

struct Forecast {
  var currentWeather: CurrentWeather?
  var weekly: [DailyWeather] = []
  
  init(weatherDictionary: [String: AnyObject]?) {
    if let currentWeatherDictionary = weatherDictionary?["currently"] as? [String: AnyObject] {
      currentWeather = CurrentWeather(weatherDictionary: currentWeatherDictionary)
    }
    if let weeklyWeatherArray = weatherDictionary?["daily"]?["data"] as? [[String: AnyObject]] {
      for dailyWeather in weeklyWeatherArray {
        let daily = DailyWeather(dailyWeatherDict: dailyWeather)
        weekly.append(daily)
      }
    }
  }
}