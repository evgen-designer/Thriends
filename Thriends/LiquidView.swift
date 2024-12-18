//
//  LiquidView.swift
//  Thriends
//
//  Created by Mac on 18/12/2024.
//

import SwiftUI

struct LiquidView: View {
    @State var currentColor: Color = .red
    
    var body: some View {
        ZStack {
            currentColor
                .mask(T700View())
                .onTapGesture {
                    currentColor = randomColor()
                }
        }
        .ignoresSafeArea()
    }
    
    func randomColor() -> Color {
        Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}

#Preview {
    LiquidView()
}
