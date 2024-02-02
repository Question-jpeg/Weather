//
//  Storm.swift
//  Weather
//
//  Created by Игорь Михайлов on 12.11.2023.
//

import SwiftUI

class Storm {
    enum Contents: CaseIterable {
        case none, rain, snow
    }
    
    var drops = [StormDrop]()
    var lastUpdate = Date.now
    var image: Image
    
    init(type: Contents, direction: Angle, strength: Int) {
        switch type {
        case .snow:
            image = Image("snow")
        default:
            image = Image("rain")
        }
        
        for _ in 0..<strength {
            newDrop(type: type, direction: direction)
        }
    }
    
    private func newDrop(type: Contents, direction: Angle) {
        let x = Double.random(in: -0.2...1.2)
        let y = Double.random(in: -0.2...1.2)
        var particleDirection = direction + .degrees(90)
        
        let xScale: Double
        let yScale: Double
        let speed: Double
        let opacity: Double
        let rotation: Angle
        let rotationSpeed: Angle
        
        switch type {
        case .snow:
            particleDirection += .degrees(.random(in: -15...15))
            
            xScale = .random(in: 0.125...1)
            yScale = xScale * .random(in: 0.5...1)
            speed = .random(in: 0.2...0.6)
            opacity = .random(in: 0.2...1)
            rotation = .degrees(.random(in: 0...360))
            rotationSpeed = .degrees(.random(in: -360...360))
        default:
            xScale = .random(in: 0.4...1)
            yScale = xScale
            speed = .random(in: 1...2)
            opacity = .random(in: 0.05...0.3)
            rotation = .zero
            rotationSpeed = .zero
        }
        let drop = StormDrop(
            x: x, y: y,
            xScale: xScale, yScale: yScale,
            speed: speed, opacity: opacity,
            direction: particleDirection,
            rotation: rotation,
            rotationSpeed: rotationSpeed
        )
        drops.append(drop)
    }
    
    func update(date: Date, size: CGSize) {
        let delta = date.timeIntervalSince1970 - lastUpdate.timeIntervalSince1970
        let divisor = size.height / size.width
        
        for drop in drops {
            let radians = drop.direction.radians
            
            drop.x += cos(radians) * drop.speed * delta * divisor
            drop.y += sin(radians) * drop.speed * delta
            
            if drop.x < -0.2 {
                drop.x += 1.4
            }
            
            if drop.y > 1.2 {
                drop.x = .random(in: -0.2...1.2)
                drop.y -= 1.4
            }
        }
        
        lastUpdate = date
    }
}
