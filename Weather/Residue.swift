//
//  Residue.swift
//  Weather
//
//  Created by Игорь Михайлов on 12.11.2023.
//

import SwiftUI

class Residue {
    var drops = Set<ResidueDrop>()
    var lastUpdate = Date.now
    var nextCreationTime = Date.now
    
    let image = Image("snow")
    let type: Storm.Contents
    
    let creationAmount: Int
    let lifetime: ClosedRange<Double>
    let creationDelay: ClosedRange<Double>?
    
    let leftEdge = 0.1
    let rightEdge = 0.9
    
    init(type: Storm.Contents, strength: Double) {
        self.type = type
        
        switch type {
        case .snow:
            creationAmount = 1
            lifetime = 1.0...2.0
        default:
            creationAmount = 5
            lifetime = 0.7...0.9
        }
        
        if type == .none || strength == 0 {
            creationDelay = nil
        } else {
            switch strength {
            case 1...200:
                creationDelay = 0...0.25
            case 201...400:
                creationDelay = 0...0.1
            case 401...800:
                creationDelay = 0...0.05
            default:
                creationDelay = 0...0.02
            }
        }
    }
    
    private func newResidue(dropX: Double, currentTime: Double) {
        let scale: Double
        let opacity: Double
        let speed: Double
        let xMovement: Double
        let yMovement: Double
        
        switch type {
        case .snow:
            scale = .random(in: 0.125...0.75)
            opacity = .random(in: 0.2...0.7)
            speed = 0
            xMovement = 0
            yMovement = 0
        default:
            scale = .random(in: 0.4...0.5)
            opacity = .random(in: 0...0.3)
            speed = 2
            
            let direction = Angle.degrees(.random(in: 225...315)).radians
            xMovement = cos(direction)
            yMovement = sin(direction)
        }
        
        let drop = ResidueDrop(
            type: type,
            x: dropX,
            y: 0.5,
            scale: scale,
            speed: speed,
            opacity: opacity,
            xMovement: xMovement,
            yMovement: yMovement,
            destructionTime: currentTime + .random(in: lifetime)
        )
        drops.insert(drop)
    }
    
    func update(date: Date, size: CGSize) {
        guard let creationDelay else { return }
        
        let currentTime = date.timeIntervalSince1970
        let delta = currentTime - lastUpdate.timeIntervalSince1970
        let divisor = size.height / size.width
        
        for drop in drops {
            drop.x += drop.xMovement * drop.speed * delta * divisor
            drop.y += drop.yMovement * drop.speed * delta
            
            drop.yMovement += delta * 4
            
            if drop.y > 0.5 && drop.x > leftEdge && drop.x < rightEdge {
                drop.y = 0.5
                drop.yMovement = 0
            }
            
            if drop.destructionTime < currentTime {
                drops.remove(drop)
            }
        }
        
        if nextCreationTime.timeIntervalSince1970 < currentTime {
            let dropX = Double.random(in: leftEdge...rightEdge)
            
            for _ in 0..<creationAmount {
                newResidue(dropX: dropX, currentTime: currentTime)
            }
            
            nextCreationTime = Date.now + .random(in: creationDelay)
        }
        
        lastUpdate = date
    }
}
