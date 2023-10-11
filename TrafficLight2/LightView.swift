//
//  LightView.swift
//  TrafficLight2
//
//  Created by HOLY NADRUGANTIX on 11.10.2023.
//

import SwiftUI

enum TLStyle {
    case red
    case yellow
    case green
    case stop
    case go
    
    var color: Color {
        switch self {
        case .red: .red
        case .yellow: .yellow
        case .green: .green
        case .stop: .gray
        case .go: .gray
        }
    }
}

struct LightView: View {
    let style: TLStyle
    let isOn: Bool
    
    private let size = 100.0
    
    var body: some View {
        if style == .go || style == .stop {
        ZStack {
            Circle()
                .foregroundStyle(style.color)
                .opacity(0.4)
                .frame(width: size, height: size)
                .overlay(Circle().stroke(Color.secondary, lineWidth: 4))
            Image(systemName: style == .stop ? "figure.stand": "figure.walk")
                .resizable()
                .opacity(isOn ? 1 : 0.3)
                .foregroundStyle(style == .stop ? .red : .green)
                .aspectRatio(contentMode: .fit)
                .frame(height: size * 0.75)
            }
        } else {
            Circle()
                .foregroundStyle(style.color)
                .opacity(isOn ? 1 : 0.3)
                .frame(width: size, height: size)
                .overlay(Circle().stroke(Color.secondary, lineWidth: 4))
        }
    }
}

#Preview {
    LightView(style: .stop, isOn: true)
}
