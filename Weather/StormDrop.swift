//
//  StormDrop.swift
//  Weather
//
//  Created by Игорь Михайлов on 12.11.2023.
//

import SwiftUI

class StormDrop {
    var x: Double
    var y: Double
    var xScale: Double
    var yScale: Double
    var speed: Double
    var opacity: Double
    
    var direction: Angle
    var rotation: Angle
    var rotationSpeed: Angle
    
    init(x: Double, y: Double, xScale: Double, yScale: Double, speed: Double, opacity: Double, direction: Angle, rotation: Angle, rotationSpeed: Angle) {
        self.x = x
        self.y = y
        self.xScale = xScale
        self.yScale = yScale
        self.speed = speed
        self.opacity = opacity
        
        self.direction = direction
        self.rotation = rotation
        self.rotationSpeed = rotationSpeed
    }
}
