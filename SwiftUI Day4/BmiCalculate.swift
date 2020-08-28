//
//  BmiCalculate.swift
//  SwiftUI Day4
//
//  Created by tahani alrashidi on 8/26/20.
//  Copyright © 2020 Aldana Al-Rashidi. All rights reserved.
//

import SwiftUI

struct BmiCalculate: View {
    @State var weight: String = ""
    @State var height: String = ""
    @State var bmi: String = "0.0"
    @State var bmiStatus: String = "-"
    var body: some View {
        VStack{
            Text("Welcome to BMI Calculator")
                .font(.title).bold()
            TextField("height in (m)", text: $height)
            TextField("weight in (kg)", text: $weight)
            Button(action: {
                self.calculateBmiAndUpdateView()
            }) {
                Text("calculate")
                    .foregroundColor(.white)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 10)
                    .background(Color(#colorLiteral(red: 0.004461955279, green: 0.4793428183, blue: 0.9990835786, alpha: 1)))
                    .clipShape(Capsule())
            }
            VStack{
            Text("BMI")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(bmi)
                .font(.system(size: 70))
                .fontWeight(.heavy)
                .padding()
            Text("Status")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(bmiStatus)
                .font(.system(size: 60))
                .fontWeight(.heavy)
                .padding()
            }.padding()
        }.padding()
    }
    
    func calculateBmi(weight: Double, height: Double) -> Double{
        return weight / (height*height)
    }
    
    func bmiStatus(bmi: Double) -> String
    {
        switch bmi{
        case ..<20:     return "ضعيف"
        case 20..<25:   return "جيد"
        case 25...:     return "سمين"
        default:        return "خطأ"
        }
    }
    func calculateBmiAndUpdateView(){
        let weight = Double(self.weight)!
        let height = Double(self.height)!
        let bmi = calculateBmi(weight: weight, height: height)
        let bmiStatus = self.bmiStatus(bmi: bmi)
        self.bmi = String(format: "%.1f", bmi)
        self.bmiStatus = bmiStatus
    }
}

struct BmiCalculate_Previews: PreviewProvider {
    static var previews: some View {
        BmiCalculate()
    }
}

