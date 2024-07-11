//
//  ThreadsLogo.swift
//  Thriends
//
//  Created by Mac on 11/07/2024.
//

import SwiftUI

struct ThreadsLogo: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.77432*width, y: 0.46348*height))
        path.addCurve(to: CGPoint(x: 0.75915*width, y: 0.45753*height), control1: CGPoint(x: 0.76934*width, y: 0.46142*height), control2: CGPoint(x: 0.76428*width, y: 0.45943*height))
        path.addCurve(to: CGPoint(x: 0.50941*width, y: 0.23305*height), control1: CGPoint(x: 0.75022*width, y: 0.3153*height), control2: CGPoint(x: 0.66034*width, y: 0.23388*height))
        path.addCurve(to: CGPoint(x: 0.50736*width, y: 0.23304*height), control1: CGPoint(x: 0.50873*width, y: 0.23304*height), control2: CGPoint(x: 0.50805*width, y: 0.23304*height))
        path.addCurve(to: CGPoint(x: 0.2958*width, y: 0.32698*height), control1: CGPoint(x: 0.41709*width, y: 0.23304*height), control2: CGPoint(x: 0.34201*width, y: 0.26636*height))
        path.addLine(to: CGPoint(x: 0.3788*width, y: 0.37621*height))
        path.addCurve(to: CGPoint(x: 0.5074*width, y: 0.32128*height), control1: CGPoint(x: 0.41332*width, y: 0.33093*height), control2: CGPoint(x: 0.4675*width, y: 0.32128*height))
        path.addCurve(to: CGPoint(x: 0.50878*width, y: 0.32128*height), control1: CGPoint(x: 0.50786*width, y: 0.32128*height), control2: CGPoint(x: 0.50832*width, y: 0.32128*height))
        path.addCurve(to: CGPoint(x: 0.62025*width, y: 0.35841*height), control1: CGPoint(x: 0.55848*width, y: 0.32155*height), control2: CGPoint(x: 0.59598*width, y: 0.33404*height))
        path.addCurve(to: CGPoint(x: 0.65557*width, y: 0.43158*height), control1: CGPoint(x: 0.63791*width, y: 0.37614*height), control2: CGPoint(x: 0.64972*width, y: 0.40065*height))
        path.addCurve(to: CGPoint(x: 0.51292*width, y: 0.42564*height), control1: CGPoint(x: 0.61151*width, y: 0.42511*height), control2: CGPoint(x: 0.56386*width, y: 0.42312*height))
        path.addCurve(to: CGPoint(x: 0.28337*width, y: 0.60569*height), control1: CGPoint(x: 0.36943*width, y: 0.43279*height), control2: CGPoint(x: 0.27718*width, y: 0.50515*height))
        path.addCurve(to: CGPoint(x: 0.36611*width, y: 0.72922*height), control1: CGPoint(x: 0.28652*width, y: 0.65669*height), control2: CGPoint(x: 0.3159*width, y: 0.70056*height))
        path.addCurve(to: CGPoint(x: 0.52007*width, y: 0.76262*height), control1: CGPoint(x: 0.40857*width, y: 0.75345*height), control2: CGPoint(x: 0.46325*width, y: 0.7653*height))
        path.addCurve(to: CGPoint(x: 0.69507*width, y: 0.68904*height), control1: CGPoint(x: 0.59512*width, y: 0.75906*height), control2: CGPoint(x: 0.65399*width, y: 0.73431*height))
        path.addCurve(to: CGPoint(x: 0.7547*width, y: 0.55399*height), control1: CGPoint(x: 0.72626*width, y: 0.65467*height), control2: CGPoint(x: 0.74599*width, y: 0.61012*height))
        path.addCurve(to: CGPoint(x: 0.83161*width, y: 0.62673*height), control1: CGPoint(x: 0.79046*width, y: 0.57265*height), control2: CGPoint(x: 0.81697*width, y: 0.59721*height))
        path.addCurve(to: CGPoint(x: 0.78013*width, y: 0.8266*height), control1: CGPoint(x: 0.8565*width, y: 0.67691*height), control2: CGPoint(x: 0.85795*width, y: 0.75938*height))
        path.addCurve(to: CGPoint(x: 0.50611*width, y: 0.91177*height), control1: CGPoint(x: 0.71194*width, y: 0.8855*height), control2: CGPoint(x: 0.62998*width, y: 0.91098*height))
        path.addCurve(to: CGPoint(x: 0.19722*width, y: 0.79853*height), control1: CGPoint(x: 0.3687*width, y: 0.91089*height), control2: CGPoint(x: 0.26478*width, y: 0.87279*height))
        path.addCurve(to: CGPoint(x: 0.10003*width, y: 0.5*height), control1: CGPoint(x: 0.13395*width, y: 0.72899*height), control2: CGPoint(x: 0.10125*width, y: 0.62855*height))
        path.addCurve(to: CGPoint(x: 0.19722*width, y: 0.20147*height), control1: CGPoint(x: 0.10125*width, y: 0.37145*height), control2: CGPoint(x: 0.13395*width, y: 0.27101*height))
        path.addCurve(to: CGPoint(x: 0.5061*width, y: 0.08823*height), control1: CGPoint(x: 0.26478*width, y: 0.12721*height), control2: CGPoint(x: 0.3687*width, y: 0.08911*height))
        path.addCurve(to: CGPoint(x: 0.82039*width, y: 0.20202*height), control1: CGPoint(x: 0.64451*width, y: 0.08912*height), control2: CGPoint(x: 0.75023*width, y: 0.1274*height))
        path.addCurve(to: CGPoint(x: 0.89781*width, y: 0.33828*height), control1: CGPoint(x: 0.85478*width, y: 0.23861*height), control2: CGPoint(x: 0.88072*width, y: 0.28463*height))
        path.addLine(to: CGPoint(x: 0.99508*width, y: 0.31584*height))
        path.addCurve(to: CGPoint(x: 0.89738*width, y: 0.1457*height), control1: CGPoint(x: 0.97436*width, y: 0.2498*height), control2: CGPoint(x: 0.94175*width, y: 0.19289*height))
        path.addCurve(to: CGPoint(x: 0.50644*width, y: 0), control1: CGPoint(x: 0.80745*width, y: 0.05003*height), control2: CGPoint(x: 0.67592*width, y: 0.00102*height))
        path.addLine(to: CGPoint(x: 0.50576*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.11921*width, y: 0.14625*height), control1: CGPoint(x: 0.33664*width, y: 0.00101*height), control2: CGPoint(x: 0.20658*width, y: 0.05022*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.49965*height), control1: CGPoint(x: 0.04146*width, y: 0.2317*height), control2: CGPoint(x: 0.00135*width, y: 0.3506*height))
        path.addLine(to: CGPoint(x: 0, y: 0.5*height))
        path.addLine(to: CGPoint(x: 0, y: 0.50035*height))
        path.addCurve(to: CGPoint(x: 0.11921*width, y: 0.85376*height), control1: CGPoint(x: 0.00135*width, y: 0.6494*height), control2: CGPoint(x: 0.04146*width, y: 0.7683*height))
        path.addCurve(to: CGPoint(x: 0.50576*width, y: height), control1: CGPoint(x: 0.20658*width, y: 0.94978*height), control2: CGPoint(x: 0.33664*width, y: 0.99899*height))
        path.addLine(to: CGPoint(x: 0.50644*width, y: height))
        path.addCurve(to: CGPoint(x: 0.85011*width, y: 0.88964*height), control1: CGPoint(x: 0.65681*width, y: 0.9991*height), control2: CGPoint(x: 0.7628*width, y: 0.96506*height))
        path.addCurve(to: CGPoint(x: 0.92325*width, y: 0.59136*height), control1: CGPoint(x: 0.96434*width, y: 0.79097*height), control2: CGPoint(x: 0.9609*width, y: 0.66729*height))
        path.addCurve(to: CGPoint(x: 0.77432*width, y: 0.46348*height), control1: CGPoint(x: 0.89624*width, y: 0.53691*height), control2: CGPoint(x: 0.84474*width, y: 0.49269*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.5147*width, y: 0.67452*height))
        path.addCurve(to: CGPoint(x: 0.38325*width, y: 0.6009*height), control1: CGPoint(x: 0.45181*width, y: 0.67758*height), control2: CGPoint(x: 0.38647*width, y: 0.65317*height))
        path.addCurve(to: CGPoint(x: 0.51856*width, y: 0.51373*height), control1: CGPoint(x: 0.38086*width, y: 0.56214*height), control2: CGPoint(x: 0.41516*width, y: 0.51889*height))
        path.addCurve(to: CGPoint(x: 0.55344*width, y: 0.51285*height), control1: CGPoint(x: 0.5304*width, y: 0.51314*height), control2: CGPoint(x: 0.54202*width, y: 0.51285*height))
        path.addCurve(to: CGPoint(x: 0.65808*width, y: 0.52205*height), control1: CGPoint(x: 0.591*width, y: 0.51285*height), control2: CGPoint(x: 0.62614*width, y: 0.51601*height))
        path.addCurve(to: CGPoint(x: 0.5147*width, y: 0.67452*height), control1: CGPoint(x: 0.64617*width, y: 0.6507*height), control2: CGPoint(x: 0.57628*width, y: 0.67159*height))
        path.closeSubpath()
        return path
    }
}
