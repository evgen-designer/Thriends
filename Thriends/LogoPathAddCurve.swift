//
//  LogoPathAddCurve.swift
//  Thriends
//
//  Created by Mac on 11/07/2024.
//


import SwiftUI

struct LogoPathAddCurve: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 22)
                .fill(Color.black)
                .frame(width: 300, height: 300)
            
            Path { path in
                // Start point
                path.move(to: CGPoint(x: 78, y: 32))
                
                // Top right curve
                path.addCurve(
                    to: CGPoint(x: 50, y: 15),
                    control1: CGPoint(x: 74, y: 20),
                    control2: CGPoint(x: 60, y: 15)
                )
                
                // Left curve
                path.addCurve(
                    to: CGPoint(x: 25, y: 50),
                    control1: CGPoint(x: 35, y: 15),
                    control2: CGPoint(x: 22, y: 30)
                )
                
                // Bottom curve
                path.addCurve(
                    to: CGPoint(x: 70, y: 70),
                    control1: CGPoint(x: 25, y: 70),
                    control2: CGPoint(x: 50, y: 85)
                )
                path.addCurve(
                    to: CGPoint(x: 43, y: 47),
                    control1: CGPoint(x: 80, y: 60),
                    control2: CGPoint(x: 48, y: 35)
                )
                path.addCurve(
                    to: CGPoint(x: 66, y: 42),
                    control1: CGPoint(x: 44, y: 71),
                    control2: CGPoint(x: 65, y: 60)
                )
                path.addCurve(
                    to: CGPoint(x: 44, y: 35),
                    control1: CGPoint(x: 60, y: 24),
                    control2: CGPoint(x: 45, y: 27)
                )
            }
            .stroke(Color.white, lineWidth: 7)
            .frame(width: 100, height: 100)
        }
    }
}

#Preview {
    LogoPathAddCurve()
}
