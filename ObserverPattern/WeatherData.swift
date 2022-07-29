//
//  WeatherData.swift
//  ObserverPattern
//
//  Created by Binary Kim on 2022/07/30.
//

import Foundation

protocol Subject {
    func registerObserver(observer: Observer)
    func removeObserver(observer: Observer)
    func notifyObservers()
}

protocol Observer: AnyObject {
    func update(temperature: Float, humidity: Float, pressure: Float)
}

class WeatherData: Subject {
    private var observers: [Observer] = []
    private var temperature: Float = 0
    private var humidity: Float = 0
    private var pressure: Float = 0
    
    func registerObserver(observer: Observer) {
        self.observers.append(observer)
    }
    
    func removeObserver(observer: Observer) {
        if let index = self.observers.firstIndex(where: { $0 === observer }) {
            self.observers.remove(at: index)
        } else {
            print("no such observer in this subject")
        }
    }
    
    func notifyObservers() {
        for observer in self.observers {
            observer.update(temperature: self.temperature, humidity: self.humidity, pressure: self.pressure)
        }
    }
    
    func measurementsChanged() {
        self.notifyObservers()
    }
    
    func setMeasurements(temperature: Float, humidity: Float, pressure: Float) {
        self.temperature = temperature
        self.humidity = humidity
        self.pressure = pressure
        self.measurementsChanged()
    }
}
