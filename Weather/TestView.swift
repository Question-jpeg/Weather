//
//  TestView.swift
//  Weather
//
//  Created by Игорь Михайлов on 11.11.2023.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        Canvas { context, size in
            context.translateBy(x: 300, y: -400)
            context.scaleBy(x: 5, y: 5)
            context.draw(Image("cloud0"), at: .zero, anchor: .topLeading)
        }
    }
}

#Preview {
    TestView()
}
