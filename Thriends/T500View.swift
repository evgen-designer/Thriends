//
//  T500View.swift
//  Thriends
//
//  Created by Mac on 15/11/2024.
//

import SwiftUI

struct Firework: Identifiable {
    let id = UUID()
    var position: CGPoint
    var color: Color
    var scale: CGFloat = 1.0
    var opacity: Double = 1.0
}

struct FireworkView: View {
    let firework: Firework
    
    var body: some View {
        ZStack {
            ForEach(0..<12) { index in
                Rectangle()
                    .fill(firework.color)
                    .frame(width: 3, height: 12)
                    .offset(y: -20)
                    .rotationEffect(.degrees(Double(index) * 30))
            }
        }
        .scaleEffect(firework.scale)
        .opacity(firework.opacity)
        .position(firework.position)
    }
}

struct T500View: View {
    @State private var currentNumber = 495
    @State private var scale: CGFloat = 1.0
    @State private var rotationAngle: Double = 0
    @State private var metalEffect: Double = 0
    @State private var fireworks: [Firework] = []
    @State private var isGlowing = false
    @State private var colorIndex = 0
    @State private var fireworkTimer: Timer?
    
    let celebrationColors: [Color] = [.red, .blue, .green, .purple, .orange, .yellow]
    let colorTimer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    let metalGradient = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 0.75, green: 0.75, blue: 0.75),
            Color(red: 0.9, green: 0.9, blue: 0.9),
            Color(red: 0.6, green: 0.6, blue: 0.6),
            Color(red: 0.8, green: 0.8, blue: 0.8)
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    func startFireworks(in geometry: GeometryProxy) {
        // Stop any existing timer
        fireworkTimer?.invalidate()
        
        // Create new timer that fires every 0.5 seconds
        fireworkTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            createFireworks(in: geometry)
        }
    }
    
    func stopFireworks() {
        fireworkTimer?.invalidate()
        fireworkTimer = nil
        // Clear existing fireworks
        fireworks.removeAll()
    }
    
    func addFirework(at position: CGPoint) {
        let firework = Firework(
            position: position,
            color: celebrationColors.randomElement() ?? .red
        )
        fireworks.append(firework)
        
        withAnimation(.easeOut(duration: 0.8)) {
            if let index = fireworks.firstIndex(where: { $0.id == firework.id }) {
                fireworks[index].scale = 2.0
                fireworks[index].opacity = 0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            fireworks.removeAll(where: { $0.id == firework.id })
        }
    }
    
    func createFireworks(in geometry: GeometryProxy) {
        let width = geometry.size.width
        let height = geometry.size.height
        
        // Create 5 fireworks at a time for continuous effect
        for _ in 0..<5 {
            let randomX = CGFloat.random(in: 0...width)
            let randomY = CGFloat.random(in: 0...height)
            addFirework(at: CGPoint(x: randomX, y: randomY))
        }
    }
    
    var numberGradient: LinearGradient {
        if currentNumber == 500 {
            return LinearGradient(
                gradient: Gradient(colors: [
                    celebrationColors[colorIndex],
                    celebrationColors[(colorIndex + 1) % celebrationColors.count]
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        } else {
            return metalGradient
        }
    }
    
    var numberView: some View {
        Text("\(currentNumber)")
            .font(.system(size: 120, weight: .bold, design: .rounded))
            .foregroundStyle(numberGradient)
            .overlay(
                GeometryReader { geometry in
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.white.opacity(0.3),
                            Color.clear
                        ]),
                        startPoint: UnitPoint(x: 0, y: metalEffect),
                        endPoint: UnitPoint(x: 1, y: metalEffect + 0.2)
                    )
                    .mask(
                        Text("\(currentNumber)")
                            .font(.system(size: 120, weight: .bold, design: .rounded))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    )
                }
            )
            .shadow(
                color: currentNumber == 500 ? celebrationColors[colorIndex].opacity(0.5) : .white.opacity(0.3),
                radius: currentNumber == 500 ? 25 : 15,
                x: -5,
                y: -5
            )
            .shadow(
                color: currentNumber == 500 ? celebrationColors[colorIndex].opacity(0.5) : .black.opacity(0.5),
                radius: currentNumber == 500 ? 25 : 15,
                x: 5,
                y: 5
            )
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                // Fireworks
                ForEach(fireworks) { firework in
                    FireworkView(firework: firework)
                }
                
                // Metallic Number
                numberView
                    .scaleEffect(scale)
                    .rotation3DEffect(
                        .degrees(rotationAngle),
                        axis: (x: 1.0, y: 1.0, z: 0.0)
                    )
                    .onTapGesture {
                        withAnimation(.spring(response: 0.6, dampingFraction: 0.5)) {
                            // Increment number with rollover
                            if currentNumber == 500 {
                                currentNumber = 495
                                isGlowing = false
                                stopFireworks() // Stop fireworks when returning to 495
                            } else {
                                currentNumber += 1
                                if currentNumber == 500 {
                                    isGlowing = true
                                    startFireworks(in: geometry) // Start continuous fireworks
                                }
                            }
                            
                            // Scale animation
                            scale = 1.2
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                withAnimation(.spring()) {
                                    scale = 1.0
                                }
                            }
                            
                            // Rotation animation
                            rotationAngle += 360
                            
                            // Metal shine effect animation
                            withAnimation(.linear(duration: 1.0)) {
                                metalEffect = 1.0
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                                    metalEffect = 0
                                }
                            }
                        }
                    }
            }
        }
        .onReceive(colorTimer) { _ in
            if currentNumber == 500 {
                withAnimation {
                    colorIndex = (colorIndex + 1) % celebrationColors.count
                }
            }
        }
        .onDisappear {
            // Clean up timer when view disappears
            stopFireworks()
        }
    }
}

#Preview {
    T500View()
}
