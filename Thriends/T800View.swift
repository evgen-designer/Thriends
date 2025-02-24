//
//  T800View.swift
//  Thriends
//
//  Created by Mac on 24/02/2025.
//

import SwiftUI

struct T800View: View {
    var body: some View {
        ZStack {
            MetalView()
                .edgesIgnoringSafeArea(.all)

            Vector800View()
                .frame(width: 300, height: 200)
        }
    }
}

#Preview {
    T800View()
}
