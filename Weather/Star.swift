//
//  Star.swift
//  Weather
//
//  Created by Игорь Михайлов on 11.11.2023.
//

import Foundation

class Star {
    var x: Double
    var y: Double
    let size: Double
    let flickerInterval: Double
    
    init(x: Double, y: Double, size: Double, flickerInterval: Double) {
        self.x = x
        self.y = y
        self.size = size
        self.flickerInterval = flickerInterval
    }
}
