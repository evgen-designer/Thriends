//
//  BlueSkyLogo.swift
//  Thriends
//
//  Created by Mac on 16/12/2024.
//

import SwiftUI

struct BlueSkyLogo: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.2262*width, y: 0.08307*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.47073*height), control1: CGPoint(x: 0.33703*width, y: 0.17726*height), control2: CGPoint(x: 0.45623*width, y: 0.36824*height))
        path.addCurve(to: CGPoint(x: 0.7738*width, y: 0.08307*height), control1: CGPoint(x: 0.54377*width, y: 0.36825*height), control2: CGPoint(x: 0.66297*width, y: 0.17726*height))
        path.addCurve(to: CGPoint(x: 0.98333*width, y: 0.12986*height), control1: CGPoint(x: 0.85376*width, y: 0.01511*height), control2: CGPoint(x: 0.98333*width, y: -0.03748*height))
        path.addCurve(to: CGPoint(x: 0.95648*width, y: 0.45074*height), control1: CGPoint(x: 0.98333*width, y: 0.16328*height), control2: CGPoint(x: 0.96641*width, y: 0.41059*height))
        path.addCurve(to: CGPoint(x: 0.6844*width, y: 0.60439*height), control1: CGPoint(x: 0.92197*width, y: 0.59034*height), control2: CGPoint(x: 0.79624*width, y: 0.62594*height))
        path.addCurve(to: CGPoint(x: 0.82222*width, y: 0.8916*height), control1: CGPoint(x: 0.8799*width, y: 0.64206*height), control2: CGPoint(x: 0.92963*width, y: 0.76683*height))
        path.addCurve(to: CGPoint(x: 0.50617*width, y: 0.75619*height), control1: CGPoint(x: 0.61824*width, y: 1.12856*height), control2: CGPoint(x: 0.52904*width, y: 0.83214*height))
        path.addCurve(to: CGPoint(x: 0.5*width, y: 0.74129*height), control1: CGPoint(x: 0.50198*width, y: 0.74227*height), control2: CGPoint(x: 0.50002*width, y: 0.73575*height))
        path.addCurve(to: CGPoint(x: 0.49382*width, y: 0.75619*height), control1: CGPoint(x: 0.49997*width, y: 0.73575*height), control2: CGPoint(x: 0.49801*width, y: 0.74227*height))
        path.addCurve(to: CGPoint(x: 0.17777*width, y: 0.8916*height), control1: CGPoint(x: 0.47096*width, y: 0.83214*height), control2: CGPoint(x: 0.38176*width, y: 1.12857*height))
        path.addCurve(to: CGPoint(x: 0.3156*width, y: 0.60439*height), control1: CGPoint(x: 0.07036*width, y: 0.76683*height), control2: CGPoint(x: 0.12009*width, y: 0.64205*height))
        path.addCurve(to: CGPoint(x: 0.04351*width, y: 0.45074*height), control1: CGPoint(x: 0.20375*width, y: 0.62594*height), control2: CGPoint(x: 0.07801*width, y: 0.59034*height))
        path.addCurve(to: CGPoint(x: 0.01666*width, y: 0.12986*height), control1: CGPoint(x: 0.03358*width, y: 0.41059*height), control2: CGPoint(x: 0.01666*width, y: 0.16327*height))
        path.addCurve(to: CGPoint(x: 0.22619*width, y: 0.08307*height), control1: CGPoint(x: 0.01666*width, y: -0.03748*height), control2: CGPoint(x: 0.14623*width, y: 0.01511*height))
        path.addLine(to: CGPoint(x: 0.2262*width, y: 0.08307*height))
        path.closeSubpath()
        return path
    }
}

#Preview {
    BlueSkyLogo()
}
