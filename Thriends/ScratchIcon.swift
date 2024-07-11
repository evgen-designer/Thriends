//
//  ScratchIcon.swift
//  Thriends
//
//  Created by Mac on 11/07/2024.
//

import SwiftUI

struct ScratchIcon: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            ScratchableView()
        }
    }
}

struct ScratchableView: View {
    @State private var scratches: [CGPoint] = []
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.black)
            
            Image("marekminor")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.white)
            
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.gray.opacity(0.25), lineWidth: 2)
            
            CustomGradient(
                colors: [.white, .gray, .white, .gray, .gray],
                degrees: -10,
                locations: [0, 0.05, 0.5, 0.75, 1]
            )
            .mask(
                Canvas { context, size in
                    context.fill(Path(roundedRect: CGRect(origin: .zero, size: size), cornerRadius: 24), with: .color(.white))
                    
                    for scratch in scratches {
                        context.blendMode = .clear
                        context.fill(
                            Path(ellipseIn: CGRect(x: scratch.x - 10, y: scratch.y - 10, width: 20, height: 20)),
                            with: .color(.black)
                        )
                    }
                }
            )
            
            RoundedRectangle(cornerRadius: 24)
                .fill(Color.clear)
                .contentShape(Rectangle())
                .gesture(
                    DragGesture(minimumDistance: 0, coordinateSpace: .local)
                        .onChanged { value in
                            scratches.append(value.location)
                        }
                )
        }
        .frame(width: 100, height: 100)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

struct CustomGradient: View {
    let colors: [Color]
    let degrees: Double
    let locations: [CGFloat]
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                LinearGradient(
                    gradient: Gradient(stops: zip(colors, locations).map { Gradient.Stop(color: $0, location: $1) }),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .rotationEffect(.degrees(degrees))
                .frame(width: geometry.size.width * 1.8, height: geometry.size.height * 4)
                .offset(x: -geometry.size.width / 2, y: -geometry.size.height / 4)
            }
            
            Text("scratch")
                .foregroundColor(.black.opacity(0.6))
                .foregroundColor(.secondary)
                .shadow(color: .white, radius: 0.1, x: -0.5, y: -0.5)
        }
    }
}

#Preview {
    ScratchIcon()
}
