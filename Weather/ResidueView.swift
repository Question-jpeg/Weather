//
//  ResidueView.swift
//  Weather
//
//  Created by Игорь Михайлов on 12.11.2023.
//

import SwiftUI

struct ResidueView: View {
    let residue: Residue
    
    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                residue.update(date: timeline.date, size: size)
                
                for drop in residue.drops {
                    let xPos = drop.x * size.width
                    let yPos = drop.y * size.height
                    
                    context.opacity = drop.opacity
                    context.translateBy(x: xPos, y: yPos)
                    context.scaleBy(x: drop.scale, y: drop.scale)
                    context.draw(residue.image, at: .zero)
                    
                    context.transform = .identity
                }
            }
        }
    }
    
    init(type: Storm.Contents, strength: Double) {
        residue = Residue(type: type, strength: strength)
    }
}

#Preview {
    ResidueView(type: .rain, strength: 200)
}
