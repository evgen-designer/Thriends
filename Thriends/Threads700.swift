//
//  Threads700.swift
//  Thriends
//
//  Created by Mac on 18/12/2024.
//

import SwiftUI

struct Threads700: View {
    var body: some View {
        VStack(spacing: -10) {
            ThreadsLogoLine()
                .stroke(Color(.black), style: StrokeStyle(lineWidth: 24, lineCap: .round, lineJoin: .round))
                .frame(width: 160, height: 190)
            
            Text("700")
                .font(.system(size: 120, weight: .black, design: .rounded))
                .foregroundColor(.black)
        }
    }
}

#Preview {
    Threads700()
}
