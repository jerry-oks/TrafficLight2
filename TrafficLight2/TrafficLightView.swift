//
//  ContentView.swift
//  TrafficLight2
//
//  Created by HOLY NADRUGANTIX on 11.10.2023.
//

import SwiftUI

struct TrafficLightView: View {
    @State private var carTLState = [false, false, false]
    @State private var pedestrianTLState = [false, false]
    @State private var buttonText = "START"
    @State private var isWorking = false
    
    var body: some View {
        VStack {
            VStack {
                LightView(style: .red, isOn: carTLState[0])
                LightView(style: .yellow, isOn: carTLState[1])
                LightView(style: .green, isOn: carTLState[2])
            }
            
            Spacer()
            
            VStack {
                LightView(style: .stop, isOn: pedestrianTLState[0])
                LightView(style: .go, isOn: pedestrianTLState[1])
            }
            
            Spacer()
            
            HStack {
                Button(action: changeLight)  {
                    Text(buttonText)
                        .bold()
                }
                .frame(width: 80)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.capsule)
                .shadow(radius: 5)
                
                if isWorking {
                    Button(action: changeState) {
                        Image(systemName: "gobackward")
                            .bold()
                    }
                    .padding()
                    .background(.red)
                    .foregroundStyle(.white)
                    .clipShape(.circle)
                    .shadow(radius: 5)
                }
            }
            .animation(.smooth(duration: 0.25), value: isWorking)
            .frame(height: 50)
        }
        .padding()
        
    }
    
    private func changeState() {
        if isWorking {
            buttonText = "START"
            carTLState = [false, false, false]
            pedestrianTLState = [false, false]
        } else {
            buttonText = "NEXT"
            carTLState[0] = true
            pedestrianTLState[1] = true
        }

        isWorking.toggle()
    }
    
    private func changeLight() {
        if buttonText == "START" {
            changeState()
            return
        }
        
        guard let current = carTLState.firstIndex(of: true) else { return }

        switch current {
        case 0, 1:
            carTLState[current].toggle()
            carTLState[current+1].toggle()
            if current == 1 { return }
        default:
            carTLState.reverse()
        }
        
        pedestrianTLState.reverse()
    }
}


#Preview {
    TrafficLightView()
}
