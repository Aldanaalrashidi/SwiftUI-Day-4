//
//  CustomButtonStyle.swift
//  SwiftUI Day4
//
//  Created by tahani alrashidi on 8/28/20.
//  Copyright © 2020 Aldana Al-Rashidi. All rights reserved.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle)
            .frame(width: 90, height: 90)
            .padding()
            .foregroundColor(.black)
            .background(Color.white)
            .scaleEffect(configuration.isPressed ? 0.9: 1.0)
    }
}
