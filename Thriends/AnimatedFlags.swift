//
//  AnimatedFlags.swift
//  Thriends
//
//  Created by Mac on 15/11/2024.
//

import SwiftUI

struct AnimatedFlags: View {
    @State private var showFlag1 = false
    @State private var showFlag2 = false
    @State private var showFlag3 = false
    
    let flagWidth: CGFloat = 80
    let flagHeight: CGFloat = 50
    
    var body: some View {
        ZStack {
            Color(.black)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                HStack(spacing: 20) {
                    // First Flag
                    if showFlag1 {
                        FlagView(text: "600", color: .green)
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                    }
                    
                    // Second Flag
                    if showFlag2 {
                        FlagView(text: "thriends", color: .yellow)
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                    }
                    
                    // Third Flag
                    if showFlag3 {
                        FlagView(text: ":)", color: .blue)
                            .transition(.move(edge: .bottom).combined(with: .opacity))
                    }
                }
                .padding(.bottom, 100)
            }
        }
        .onTapGesture {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                showFlag1 = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                    showFlag2 = true
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                    showFlag3 = true
                }
            }
        }
    }
}

struct FlagView: View {
    let text: String
    let color: Color
    
    var body: some View {
        ZStack(alignment: .leading) {
            color
                .frame(width: 80, height: 50)
            
            Text(text)
                .foregroundColor(.white)
                .padding(.leading, 10)
            
            Rectangle()
                .frame(width: 2, height: 100)
                .foregroundColor(.white)
                .offset(x: 5)
        }
    }
}

#Preview {
    AnimatedFlags()
}
