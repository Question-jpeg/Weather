//
//  ResidueDrop.swift
//  Weather
//
//  Created by Игорь Михайлов on 12.11.2023.
//

import SwiftUI

class ResidueDrop: Hashable {
    let id = UUID()
    var destructionTime: Double
    var x: Double
    var y: Double
    var scale: Double
    var speed: Double
    var opacity: Double
    var xMovement: Double
    var yMovement: Double
    
    init(type: Storm.Contents, x: Double, y: Double, scale: Double, speed: Double, opacity: Double, xMovement: Double, yMovement: Double, destructionTime: Double) {
        self.x = x
        self.y = y
        self.scale = scale
        self.speed = speed
        self.opacity = opacity
        self.xMovement = xMovement
        self.yMovement = yMovement
        self.destructionTime = destructionTime
    }
    
    static func == (lhs: ResidueDrop, rhs: ResidueDrop) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
