//
//  main.swift
//  ObserverPattern
//
//  Created by Binary Kim on 2022/07/30.
//

import Foundation

print("Hello, observer pattern!")

let weatherData = WeatherData()
let currentConditionsDisplay = CurrentConditionsDisplay(weatherData: weatherData)
let statisticsDisplay = StatisticsDisplay(weatherData: weatherData)
let forecastDisplay = ForecastDisplay(weatherData: weatherData)

weatherData.setMeasurements(temperature: 30, humidity: 30, pressure: 30)
weatherData.setMeasurements(temperature: 25, humidity: 50, pressure: 40)
weatherData.setMeasurements(temperature: 20, humidity: 32, pressure: 40)

