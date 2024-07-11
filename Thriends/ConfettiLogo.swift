//
//  ConfettiLogo.swift
//  Thriends
//
//  Created by Mac on 11/07/2024.
//

import SwiftUI

struct ConfettiLogo: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 80)
                .fill(Color.black)
                .frame(width: 300, height: 300)
                .overlay(
                    ConfettiView()
                        .clipShape(RoundedRectangle(cornerRadius: 80))
                )
            ThreadsLogo()
                .foregroundColor(.white)
                .frame(width: 172, height: 200)
        }
    }
}

struct ConfettiView: View {
    let colors: [Color] = [.red, .blue, .green, .yellow, .orange, .purple, .pink]
    let confettiCount = 50
    var body: some View {
        GeometryReader { geometry in
            ForEach(0..<confettiCount, id: \.self) { _ in
                ConfettiPiece(color: colors.randomElement()!)
                    .position(
                        x: CGFloat.random(in: 0...geometry.size.width),
                        y: CGFloat.random(in: -50...geometry.size.height)
                    )
            }
        }
    }
}

struct ConfettiPiece: View {
    @State private var yPosition: CGFloat = -50
    let color: Color
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: 10, height: 10)
            .offset(y: yPosition)
            .onAppear {
                withAnimation(Animation.linear(duration: Double.random(in: 2...5)).repeatForever(autoreverses: false)) {
                    yPosition = 400
                }
            }
    }
}

#Preview {
    ConfettiLogo()
}
