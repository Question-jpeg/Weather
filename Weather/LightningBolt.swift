//
//  LightningBolt.swift
//  Weather
//
//  Created by Игорь Михайлов on 12.11.2023.
//

import SwiftUI

class LightningBolt {
    var points = [CGPoint]()
    var width: Double
    var angle: Double
    
    init(start: CGPoint, width: Double, angle: Double) {
        points.append(start)
        self.width = width
        self.angle = angle
    }
}
