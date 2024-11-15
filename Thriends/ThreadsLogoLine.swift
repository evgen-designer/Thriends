//
//  ThreadsLogoLine.swift
//  Thriends
//
//  Created by Mac on 15/11/2024.
//

import SwiftUI

struct ThreadsLogoLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.3634*width, y: 0.33187*height))
        path.addCurve(to: CGPoint(x: 0.683*width, y: 0.34953*height), control1: CGPoint(x: 0.42784*width, y: 0.26993*height), control2: CGPoint(x: 0.59559*width, y: 0.24905*height))
        path.addCurve(to: CGPoint(x: 0.55413*width, y: 0.71679*height), control1: CGPoint(x: 0.75614*width, y: 0.43361*height), control2: CGPoint(x: 0.75001*width, y: 0.67921*height))
        path.addCurve(to: CGPoint(x: 0.36857*width, y: 0.52431*height), control1: CGPoint(x: 0.35826*width, y: 0.75437*height), control2: CGPoint(x: 0.30275*width, y: 0.58238*height))
        path.addCurve(to: CGPoint(x: 0.89691*width, y: 0.65488*height), control1: CGPoint(x: 0.47889*width, y: 0.42697*height), control2: CGPoint(x: 0.83993*width, y: 0.45796*height))
        path.addCurve(to: CGPoint(x: 0.05671*width, y: 0.54422*height), control1: CGPoint(x: 0.99485*width, y: 0.99338*height), control2: CGPoint(x: 0.08764*width, y: 1.15042*height))
        path.addCurve(to: CGPoint(x: 0.24227*width, y: 0.11285*height), control1: CGPoint(x: 0.04999*width, y: 0.41253*height), control2: CGPoint(x: 0.07731*width, y: 0.20473*height))
        path.addCurve(to: CGPoint(x: 0.94588*width, y: 0.30532*height), control1: CGPoint(x: 0.46792*width, y: -0.01284*height), control2: CGPoint(x: 0.85825*width, y: 0.03982*height))
        return path
    }
}
