//
//  Displays.swift
//  ObserverPattern
//
//  Created by Binary Kim on 2022/07/30.
//

import Foundation

protocol DisplayElement {
    func display()
}

class CurrentConditionsDisplay: Observer, DisplayElement {
    
    private var temperature: Float = 0
    private var humidity: Float = 0
    private var weatherData: WeatherData
    
    init(weatherData: WeatherData) {
        self.weatherData = weatherData
        weatherData.registerObserver(observer: self)
    }
    
    func update(temperature: Float, humidity: Float, pressure: Float) {
        self.temperature = temperature
        self.humidity = humidity
        
        self.display()
    }
    
    func display() {
        print("현재 기온은 \(temperature), 습도는 \(humidity)입니다.")
    }
    
}

class StatisticsDisplay: Observer, DisplayElement {
    
    private var temperature: Float = 0
    private var highestTemperature: Float = 0
    private var averageTemperature: Float = 0
    private var accumulatedTemperature: Float = 0
    private var dataCount: Int = 1
    
    private var weatherData: WeatherData
    
    init(weatherData: WeatherData) {
        self.weatherData = weatherData
        weatherData.registerObserver(observer: self)
    }
    
    func update(temperature: Float, humidity: Float, pressure: Float) {
        self.temperature = temperature
        if self.highestTemperature < temperature {
            self.highestTemperature = temperature
        }
        self.accumulatedTemperature += temperature
        self.averageTemperature = self.accumulatedTemperature / Float(self.dataCount)
        self.dataCount += 1
        
        self.display()
    }
    
    func display() {
        print("현재 기온은 \(self.temperature), 최고 기온은 \(self.highestTemperature)입니다. 평균 기온은 \(self.averageTemperature)입니다.")
    }
    
}
