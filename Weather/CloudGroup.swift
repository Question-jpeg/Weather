//
//  CloudGroup.swift
//  Weather
//
//  Created by Игорь Михайлов on 09.11.2023.
//

import Foundation

class CloudGroup {
    let leftEdge = -400.0
    let rightEdge = 400.0
    let topEdge = -50.0
    let bottomEdge = 200.0
    
    var clouds = [Cloud]()
    let opacity: Double
    var lastUpdate = Date.now
    
    init(thickness: Cloud.Thickness) {
        let cloudsToCreate: Int
        let cloudScale: ClosedRange<Double>
        
        switch thickness {
        case .none:
            cloudsToCreate = 0
            opacity = 1
            cloudScale = 1...1
        case .thin:
            cloudsToCreate = 10
            opacity = 0.6
            cloudScale = 0.2...0.4
        case .light:
            cloudsToCreate = 10
            opacity = 0.7
            cloudScale = 0.4...0.6
        case .regular:
            cloudsToCreate = 15
            opacity = 0.8
            cloudScale = 0.7...0.9
        case .thick:
            cloudsToCreate = 25
            opacity = 0.9
            cloudScale = 1.0...1.3
        case .ultra:
            cloudsToCreate = 40
            opacity = 1
            cloudScale = 1.2...1.6
        }
        
        for i in 0..<cloudsToCreate {
            newCloud(i: i, cloudScale: cloudScale)
        }
    }
    
    private func newCloud(i: Int, cloudScale: ClosedRange<Double>) {
        let x = Double.random(in: leftEdge...rightEdge)
        let y = Double.random(in: topEdge...bottomEdge)
        let imageNumber = i % 8
        let speed = Double.random(in: 4...24)
        let scale = Double.random(in: cloudScale)
        
        let cloud = Cloud(x: x, y: y, imageNumber: imageNumber, speed: speed, scale: scale)
        clouds.append(cloud)
    }
    
    func update(date: Date) {
        let delta = date.timeIntervalSince1970 - lastUpdate.timeIntervalSince1970
        
        for cloud in clouds {
            cloud.x -= delta * cloud.speed
            
            if cloud.x < leftEdge*cloud.scale {
                cloud.x = rightEdge
            }
        }
        
        lastUpdate = date
    }
}
