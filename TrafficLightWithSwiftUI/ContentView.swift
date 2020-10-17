//
//  ContentView.swift
//  TrafficLightWithSwiftUI
//
//  Created by Елена Червоткина on 16.10.2020.
//

import SwiftUI

struct ContentView: View {
    @State private var currentSignal = 0
    @State private var textButton = "Start"
    
    var body: some View {
        ZStack{
            Color(.black)
            VStack(spacing: 20){
                ColorCircle(color: .red, isActive: currentSignal == 1 ? true : false)
                ColorCircle(color: .yellow, isActive: currentSignal == 2 ? true : false)
                ColorCircle(color: .green, isActive: currentSignal == 3 ? true : false)
                Spacer()
                Button(action: {changeSignal()}) {
                    Text("\(textButton)")
                        .font(.title)
                        .foregroundColor(Color.white)
                        .frame(width: 100, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.white, lineWidth: 4))
                    
                    
                }
            }
            .padding(100)
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
    
    func changeSignal() {
        if currentSignal == 0 {
            textButton = "Next"
        }
        currentSignal = currentSignal >= 3 ? 1 : currentSignal + 1
    }
}

struct ColorCircle : View {
    let color : UIColor
    var isActive : Bool
    
    var body: some View {
        Color(color)
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .opacity(isActive ? 1 : 0.5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
