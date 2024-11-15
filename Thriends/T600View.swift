//
//  T600View.swift
//  Thriends
//
//  Created by Mac on 15/11/2024.
//

import SwiftUI

struct T600View: View {
    @State var show = false
    
    var body: some View {
        ZStack {
            RotatingCard(imageName: "200", rotationAngle: -60, yOffset: 120, show: show)
            RotatingCard(imageName: "300", rotationAngle: -60, yOffset: 60, show: show)
            RotatingCard(imageName: "400", rotationAngle: -60, yOffset: 0, show: show)
            RotatingCard(imageName: "500", rotationAngle: -60, yOffset: -60, show: show)
            RotatingCard(imageName: "600", rotationAngle: -60, yOffset: -120, show: show)
            
        }
        .onTapGesture {
            withAnimation(.bouncy(duration: 0.5, extraBounce: 0.01)) {
                show.toggle()
            }
        }
    }
}

struct RotatingCard: View {
    var imageName: String
    var rotationAngle: Double
    var yOffset: CGFloat
    var show: Bool
    
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 230, height: 290)
            .cornerRadius(60)
            .overlay(
                RoundedRectangle(cornerRadius: 60)
                    .stroke(Color.white, lineWidth: 4)
            )
            .rotation3DEffect(
                .radians(show ? 1 : 0),
                axis: (x: 0.8, y: 1.3, z: 0.3),
                anchor: .center,
                anchorZ: 0.0,
                perspective: show ? 0.5 : 0
            )
            .rotationEffect(.degrees(show ? rotationAngle : 0))
            .offset(y: show ? yOffset : 0)

    }
}

#Preview {
    T600View()
        .preferredColorScheme(.dark)
}
