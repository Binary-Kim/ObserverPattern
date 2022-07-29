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
    
    func update() {
        self.temperature = self.weatherData.temperature
        self.humidity = self.weatherData.humidity
        
        self.display()
    }
    
    func display() {
        print("현재 기온은 \(self.temperature), 습도는 \(self.humidity)입니다.")
    }
    
}

class StatisticsDisplay: Observer, DisplayElement {
    
    private var temperature: Float = 0
    private var highestTemperature: Float = 0
    private var averageTemperature: Float = 0
    private var accumulatedTemperature: Float = 0
    private var dataCount: Int = 1
    
    private let weatherData: WeatherData
    
    init(weatherData: WeatherData) {
        self.weatherData = weatherData
        weatherData.registerObserver(observer: self)
    }
    
    func update() {
        self.temperature = self.weatherData.temperature
        if self.highestTemperature < self.temperature {
            self.highestTemperature = self.temperature
        }
        self.accumulatedTemperature += self.temperature
        self.averageTemperature = self.accumulatedTemperature / Float(self.dataCount)
        self.dataCount += 1
        
        self.display()
    }
    
    func display() {
        print("현재 기온은 \(self.temperature), 최고 기온은 \(self.highestTemperature)입니다. 평균 기온은 \(self.averageTemperature)입니다.")
    }
    
}

class ForecastDisplay: Observer, DisplayElement {
    private var currentPressure: Float = 0.0
    private var lastPressure: Float = 0.0
    
    private let weatherData: WeatherData
    
    init(weatherData: WeatherData) {
        self.weatherData = weatherData
        weatherData.registerObserver(observer: self)
    }
    
    func update() {
        self.lastPressure = self.currentPressure
        self.currentPressure = self.weatherData.pressure
        
        self.display()
    }
    
    func display() {
        if self.currentPressure < self.lastPressure {
            print("날이 흐릴 예정입니다.")
        } else if self.currentPressure > self.lastPressure {
            print("날이 맑을 예정입니다.")
        } else {
            print("지금 같은 날씨가 계속될 예정입니다.")
        }
    }
}
