//
//  Cloud.swift
//  Weather
//
//  Created by Игорь Михайлов on 09.11.2023.
//

import SwiftUI

class Cloud {
    enum Thickness: CaseIterable {
        case none, thin, light, regular, thick, ultra
    }
    
    var x: Double
    var y: Double
    let imageNumber: Int
    let speed: Double
    let scale: Double
    
    init(x: Double, y: Double, imageNumber: Int, speed: Double, scale: Double) {
        self.x = x
        self.y = y
        self.imageNumber = imageNumber
        self.speed = speed
        self.scale = scale
    }
}
