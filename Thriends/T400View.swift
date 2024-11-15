//
//  T400View.swift
//  Thriends
//
//  Created by Mac on 15/11/2024.
//

import SwiftUI

struct T400View: View {
    @State private var animate = false
    
    var body: some View {
        VStack(spacing: 0) {
            ThreadsLogoLine()
                .trim(from: 0.0, to: animate ? 1.0 : 0.0)
                .stroke(LinearGradient(
                    colors: [.blue, .purple],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ), style: StrokeStyle(lineWidth: 24, lineCap: .round, lineJoin: .round))
                .frame(width: 300, height: 356)
            
            Text("400")
                .font(.system(size: 160, weight: .bold, design: .rounded))
                .foregroundStyle(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
        }
        .hueRotation(.degrees(animate ? 360 : 0))
        .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: animate)
        .onAppear {
            animate = true
        }
    }
}

#Preview {
    T400View()
        .preferredColorScheme(.dark)
}
