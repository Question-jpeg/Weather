//
//  MeteorShower.swift
//  Weather
//
//  Created by Игорь Михайлов on 13.11.2023.
//

import SwiftUI

class MeteorShower {
    var meteors = Set<Meteor>()
    var lastUpdate = Date.now
    
    var lastCreationDate = Date.now
    var nextCreationDelay = Double.random(in: 5...10)
    
    var intensity = 1.0
    
    func update(date: Date, size: CGSize) {
        let delta = date.timeIntervalSince1970 - lastUpdate.timeIntervalSince1970
        
        if lastCreationDate + nextCreationDelay < .now {
            createMeteor(in: size)
        }
        
        for meteor in meteors {
            if meteor.isMovingRight {
                meteor.x += delta * meteor.speed
            } else {
                meteor.x -= delta * meteor.speed
            }
            
            meteor.speed -= delta * 900
            
            if meteor.speed < 0 {
                meteors.remove(meteor)
            } else if meteor.length < 100 {
                meteor.length += delta * 300
            }
        }
        
        lastUpdate = date
    }
    
    func createMeteor(in size: CGSize) {
        let meteor: Meteor
        
        if .random() {
            meteor = Meteor(x: 0, y: .random(in: 100...300), isMovingRight: true)
        } else {
            meteor = Meteor(x: size.width, y: .random(in: 100...300), isMovingRight: false)
        }
        
        meteors.insert(meteor)
        lastCreationDate = .now
        nextCreationDelay = .random(in: 5/intensity ... 10/intensity)
    }
}
