//
//  T300View.swift
//  Thriends
//
//  Created by Mac on 15/11/2024.
//

import SwiftUI

struct T300View: View {
    @State private var count: Int = 0
    @State private var showConfetti: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing: -10) {
                Text("\(count)")
                    .font(.system(size: 80, weight: .bold, design: .rounded))
                    .onAppear {
                        startAnimation()
                }
                
                Text("thriends")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
            }
            
            if showConfetti {
                Confetti()
                    .offset(y: -40)
                    .transition(.opacity)
                    .animation(.easeInOut, value: showConfetti)
            }
        }
    }
    
    func startAnimation() {
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            if count < 300 {
                count += 1
            } else {
                showConfetti = true
            }
        }
    }
}

struct Confetti: View {
    @State private var confettiParticles: [ConfettiParticle] = []

    var body: some View {
        ZStack {
            ForEach(confettiParticles) { particle in
                Circle()
                    .fill(particle.color)
                    .frame(width: particle.size, height: particle.size)
                    .position(particle.position)
                    .animation(.linear(duration: particle.duration), value: particle.position)
            }
        }
        .onAppear {
            createConfetti()
        }
    }
    
    private func createConfetti() {
        for _ in 0..<100 {
            let size = CGFloat.random(in: 5...15)
            let position = CGPoint(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
            let color = Color(hue: Double.random(in: 0...1), saturation: 1, brightness: 1)
            let duration = Double.random(in: 2...4)
            let direction = Angle.degrees(Double.random(in: 0...360))

            let particle = ConfettiParticle(id: UUID(), position: position, size: size, color: color, duration: duration, direction: direction)
            confettiParticles.append(particle)

            withAnimation(Animation.linear(duration: duration)) {
                moveConfetti(particle: particle)
            }
        }
    }
    
    private func moveConfetti(particle: ConfettiParticle) {
        let distance = UIScreen.main.bounds.height / 2 + 100
        let xOffset = cos(particle.direction.radians) * distance
        let yOffset = sin(particle.direction.radians) * distance

        if let index = confettiParticles.firstIndex(where: { $0.id == particle.id }) {
            confettiParticles[index].position = CGPoint(x: particle.position.x + xOffset, y: particle.position.y + yOffset)
        }
    }
}

struct ConfettiParticle: Identifiable {
    let id: UUID
    var position: CGPoint
    let size: CGFloat
    let color: Color
    let duration: Double
    let direction: Angle
}

#Preview {
    T300View()
        .preferredColorScheme(.dark)
}
