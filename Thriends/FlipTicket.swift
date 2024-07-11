//
//  FlipTicket.swift
//  Thriends
//
//  Created by Mac on 11/07/2024.
//

import SwiftUI

struct ThreadsCard: View {
    @State private var rotation: Double = 0
    @State private var dragOffset: CGSize = .zero
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: 300, height: 400)
                .rotation3DEffect(
                    .degrees(rotation),
                    axis: (x: 0, y: 1, z: 0)
                )
            
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.2), .purple.opacity(0.2)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .overlay(HolographicBackground())
                .overlay(
                    VStack {
                        ThreadsLogo()
                            .frame(width: 69, height: 80)
                            .padding(.top)
                        Text("200 thriends")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom)
                        DashedLine()
                            .frame(height: 1)
                            .padding(.horizontal, 20)
                        Text("DATE")
                            .font(.caption)
                            .padding(.top)
                        Text("11 JULY 2024")
                            .font(.headline)
                        Text("USERNAME")
                            .font(.caption)
                            .padding(.top)
                        Text("BUCKLAJEAN")
                            .font(.headline)
                            .padding(.bottom)
                    }
                    .foregroundColor(.black)
                )
                .frame(width: 300, height: 400)
                .rotation3DEffect(
                    .degrees(rotation),
                    axis: (x: 0, y: 1, z: 0)
                )
            
            VStack {
                Circle()
                    .fill(.black)
                    .frame(width: 40, height: 40)
                    .offset(y: -20)
                Spacer()
                Circle()
                    .fill(.black)
                    .frame(width: 40, height: 40)
                    .offset(y: 20)
            }
            .frame(width: 300, height: 400)
            .rotation3DEffect(
                .degrees(rotation),
                axis: (x: 0, y: 1, z: 0)
            )
        }
        .gesture(
            DragGesture()
                .onChanged { value in
                    self.dragOffset = value.translation
                    self.rotation = Double(value.translation.width).truncatingRemainder(dividingBy: 360)
                }
                .onEnded { _ in
                    withAnimation(.spring()) {
                        self.dragOffset = .zero
                        self.rotation = 0
                    }
                }
        )
    }
}

struct DashedLine: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: geometry.size.width, y: 0))
            }
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
            .foregroundColor(.gray)
        }
    }
}

struct HolographicBackground: View {
    @State private var phase: CGFloat = 0
    
    var body: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                let timeNow = timeline.date.timeIntervalSinceReferenceDate
                phase = timeNow.remainder(dividingBy: 2)
                
                context.addFilter(.alphaThreshold(min: 0.5, color: .white))
                context.addFilter(.blur(radius: 30))
                
                context.drawLayer { ctx in
                    for i in stride(from: 0, to: size.width * 2, by: 10) {
                        ctx.fill(
                            Path(CGRect(x: i, y: 0, width: 1, height: size.height)),
                            with: .color(Color(hue: i / size.width, saturation: 1, brightness: 1))
                        )
                    }
                }
            }
            .offset(x: -phase * 100)
            .blendMode(.overlay)
        }
    }
}

struct FlipTicket: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                .overlay(
                    ConfettiView()
                        .clipShape(RoundedRectangle(cornerRadius: 80))
                )
            ThreadsCard()
        }
    }
}

#Preview {
    FlipTicket()
}
