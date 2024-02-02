//
//  WeatherDetailsView.swift
//  Weather
//
//  Created by Игорь Михайлов on 12.11.2023.
//

import SwiftUI

struct WeatherDetailsView: View {
    let tintColor: Color
    
    let residueType: Storm.Contents
    let residueStrength: Double
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ResidueView(type: residueType, strength: residueStrength)
                    .frame(height: 62)
                    .offset(y: 30)
                    .zIndex(1)
                
                RoundedRectangle(cornerRadius: 25)
//                    .fill(.clear)
                    .fill(tintColor.opacity(0.25))
                    .frame(height: 800)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 25))
                    .padding(.horizontal, 20)
            }
            .padding(.top, 200)
        }
    }
}

#Preview {
    WeatherDetailsView(tintColor: .blue, residueType: .rain, residueStrength: 500)
}
