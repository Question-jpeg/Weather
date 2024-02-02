//
//  Array-GradientStop.swift
//  Weather
//
//  Created by Игорь Михайлов on 11.11.2023.
//

import SwiftUI

extension Array where Element == Gradient.Stop {
    func interpolated(amount: Double) -> Color {
        guard let defaultStop = self.first else {
            fatalError("Attempted to read color from empty stop array")
        }
        
        var firstStop = defaultStop
        var secondStop = defaultStop
        
        for stop in self {
            if stop.location < amount {
                firstStop = stop
            } else {
                secondStop = stop
                break
            }
        }
        
        let diff = secondStop.location - firstStop.location
        if diff > 0 {
            let interpolationAmount = (amount - firstStop.location) / diff
            return firstStop.color.interpolated(to: secondStop.color, amount: interpolationAmount)
        }
        return firstStop.color.interpolated(to: secondStop.color, amount: 0)
    }
}
