//
//  XO.swift
//  SwiftUI Day4
//
//  Created by tahani alrashidi on 8/27/20.
//  Copyright © 2020 Aldana Al-Rashidi. All rights reserved.
//

import SwiftUI



struct XO: View {
//    @State var remember: String = ""
    @State var viewModel = GameFlow()
    @State var player: Player = .one
    @State var wonPlayer: String = ""
    
    var body: some View {
        VStack(spacing: 40){
            Text("Tic Tac Toe")
                .font(.largeTitle)
                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.7847959587, blue: 0.3754061507, alpha: 1)))
            //            Text("\(player.identity) turn")
            Text(wonPlayer.isEmpty ? "" : "\(wonPlayer) WON 🥳")
                .foregroundColor(Color(#colorLiteral(red: 1, green: 0.7847959587, blue: 0.3754061507, alpha: 1)))
                .font(.system(size: 22))
            
            
            VStack(spacing: 1){
                ForEach(0...2, id: \.self) { x in
                    HStack(spacing: 1){
                        ForEach(0...2, id: \.self) { y in
                            Button(action: {
                                // self.remember = "\(x)\(y)"
                                self.buttonTapped(key: "\(x)\(y)")
                            }) {
                                Text(self.getValue(key: "\(x)\(y)"))
                                .foregroundColor(Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)))
                                // Text(self.remember == "\(x)\(y)" ? "X": "")
                            }.buttonStyle(CustomButtonStyle())
                        }
                    }
                }
            }.background(LinearGradient(gradient: Gradient.init(colors: [.red, .yellow, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .opacity(wonPlayer.isEmpty ? 1.0: 0.7)
                .disabled(wonPlayer.isEmpty ? false: true)
            
            Button(action: {
                self.newGameButtonTapped()
            }) {
                Spacer()
                Text("New Game")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                Spacer()
            }.padding()
                .background(Color(#colorLiteral(red: 1, green: 0.7847959587, blue: 0.3754061507, alpha: 1)).opacity(0.8))
                .clipShape(Capsule())
                .padding()
        }
    }

    func buttonTapped(key: String) {
        if player == .one{
            viewModel.setValue(.cross, for: key)
        }else{
            viewModel.setValue(.circle, for: key)
        }
        
        if viewModel.isWin(){
           print("Winner: \(player)🥳")
            self.wonPlayer = player.identity
        }else{
            player.toggle()
        }
    }
    
    func getValue(key: String) -> String {
        viewModel.getValue(for: key).rawValue
    }
    
    func newGameButtonTapped(){
        viewModel.content = [:]
        player = .one
        wonPlayer = ""
    }
}

struct XO_Previews: PreviewProvider {
    static var previews: some View {
        XO()
    }
}

