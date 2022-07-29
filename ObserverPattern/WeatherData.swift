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
    func update()
}

class WeatherData: Subject {
    private var observers: [Observer] = []
    private var _temperature: Float = 0
    private var _humidity: Float = 0
    private var _pressure: Float = 0
    
    var temperature: Float {
        self._temperature
    }
    
    var humidity: Float {
        self._humidity
    }
    
    var pressure: Float {
        self._pressure
    }
    
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
            observer.update()
        }
    }
    
    func measurementsChanged() {
        self.notifyObservers()
    }
    
    func setMeasurements(temperature: Float, humidity: Float, pressure: Float) {
        self._temperature = temperature
        self._humidity = humidity
        self._pressure = pressure
        self.measurementsChanged()
    }
}
