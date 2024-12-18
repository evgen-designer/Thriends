//
//  T700View.swift
//  Thriends
//
//  Created by Mac on 18/12/2024.
//

import SwiftUI

struct CircleData: Identifiable {
    let id: UUID
    let size: CGFloat
    var xOffset: CGFloat
    var yOffset: CGFloat
    let speed: Double
}

struct T700View: View {
    @State private var circles: [CircleData] = []
    let frameWidth: CGFloat = 100
    let frameHeight: CGFloat = 200
    let maxCirles: Int = 200
    let animationInterval: TimeInterval = 0.02
    
    var body: some View {
        Canvas { context, size in
            
            let rectangleRect = CGRect(
                x: size.width / 2 - 100,
                y: size.height / 2 + 70,
                width: 200,
                height: 50
            )
            
            context.addFilter(.alphaThreshold(min: 0.4))
            context.addFilter(.blur(radius: 10))
            context.drawLayer { drawingContext in
                for circle in circles {
                    let circleRect = CGRect(
                        x: circle.xOffset + size.width / 2 - circle.size / 2,
                        y: circle.yOffset + size.height / 2 - circle.size / 2,
                        width: circle.size,
                        height: circle.size
                    )
                    drawingContext.fill(Path(ellipseIn: circleRect), with: .color(.blue))
                    drawingContext.fill(Path(roundedRect: rectangleRect, cornerRadius: 24), with: .color(.red))
                }
            }
        }
        .onAppear {
            setupAnimation()
        }
    }
    
    func setupAnimation() {
        // First timer: Runs every 0.2 seconds to generate new circles
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
            // Randomly decide how many circles to generate in this cycle (2-3)
            let circlesToGenerate = Int.random(in: 2...3)
            
            // Loop to create the specified number of new circles
            for _ in 0..<circlesToGenerate {
                // If the number of circles exceeds the maximum allowed, - remove the oldest one
                if circles.count >= maxCirles {
                    circles.removeFirst()
                }
                
                // Create a new circle with random properties
                let newCircle = CircleData(
                    id: UUID(), // Unique identifier for the circle, required since 'CircleData' conforms to 'Identifiable'
                    size: CGFloat.random(in: 10...30), // Random size between 10 and 30
                    xOffset: CGFloat.random(in: -frameWidth / 2...frameWidth / 2), // Random horizontal position within the frame's width
                    yOffset: frameHeight / 2, // Start position at the middle height of the frame (bottom edge of the moving area)
                    speed: Double.random(in: 1...2) // Random speed to control how fast the circle moves upward
                )
                
                // Add the new circle to the circles array
                circles.append(newCircle)
            }
        }
        
        // Second timer: Runs frequently (animationInterval) to update circle positions for animation
        Timer.scheduledTimer(withTimeInterval: animationInterval, repeats: true) { _ in
            // Update must occur on the main thread becaufe it involves UI changes
            DispatchQueue.main.async {
                // Loop through all circles in the 'circles' array
                circles.indices.forEach { index in
                    // Gradually decrease the 'yOffset' of each circle to move it upward
                    circles[index].yOffset -= CGFloat(circles[index].speed)
                    // This is the animation mechanism: by reducing the 'yOffset', circles move smoothly upward in the UI
                }
            }
        }
    }
}

#Preview {
    T700View()
}
