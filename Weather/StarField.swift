//
//  StarField.swift
//  Weather
//
//  Created by Игорь Михайлов on 11.11.2023.
//

import Foundation

class StarField {
    let leftEdge = -50.0
    let rightEdge = 500.0
    let topEdge = 0.0
    let bottomEdge = 600.0
    
    var stars = [Star]()
    var lastUpdate = Date.now
    
    init() {
        for _ in 1...200 {
            newStar()
        }
    }
    
    private func newStar() {
        let x = Double.random(in: leftEdge...rightEdge)
        let y = Double.random(in: topEdge...bottomEdge)
        let size = Double.random(in: 1...3)
        let flickerInterval: Double
        
        if size > 2 && y < 250 {
            flickerInterval = Double.random(in: 3...20)
        } else {
            flickerInterval = 0
        }
        
        let star = Star(x: x, y: y, size: size, flickerInterval: flickerInterval)
        stars.append(star)
    }
    
    func update(date: Date) {
        let delta = date.timeIntervalSince1970 - lastUpdate.timeIntervalSince1970
        
        for star in stars {
            star.x -= delta * 2
            
            if star.x < leftEdge {
                star.x = rightEdge
            }
        }
        
        lastUpdate = date
    }
}
