//
//  StormView.swift
//  Weather
//
//  Created by Игорь Михайлов on 12.11.2023.
//

import SwiftUI

struct StormView: View {
    let storm: Storm
    
    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                storm.update(date: timeline.date, size: size)
                
                for drop in storm.drops {
                    let xPos = drop.x * size.width
                    let yPos = drop.y * size.height
                    
                    context.opacity = drop.opacity
                    context.translateBy(x: xPos, y: yPos)
                    context.rotate(by: drop.direction + drop.rotation)
                    context.scaleBy(x: drop.xScale, y: drop.yScale)
                    context.draw(storm.image, at: .zero)
                    
                    context.transform = .identity
                }
            }
        }
        .ignoresSafeArea()
    }
    
    init(type: Storm.Contents, direction: Angle, strength: Int) {
        storm = Storm(type: type, direction: direction, strength: strength)
    }
}

#Preview {
    StormView(type: .rain, direction: .zero, strength: 200)
}
