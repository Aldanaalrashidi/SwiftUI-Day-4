//
//  GameFlow.swift
//  SwiftUI Day4
//
//  Created by tahani alrashidi on 8/28/20.
//  Copyright © 2020 Aldana Al-Rashidi. All rights reserved.
//

import Foundation

//cross = X, circle = O
enum ButtonState: String {
    case cross = "X"
    case circle = "O"
    case none = ""
}

struct GameFlow {
    var content: [String: ButtonState] = [:]
    //horizantal(3), vertical(3), cross(2)
    private var winningPosibilities: [[String]] = [["00", "01", "02"],
                                                   ["10", "11", "12"],
                                                   ["20", "21", "22"],
                                                   
                                                   ["00", "10", "20"],
                                                   ["01", "11", "21"],
                                                   ["02", "12", "22"],
                                                   
                                                   ["00", "11", "22"],
                                                   ["02", "11", "20"],]
    
    func getValue(for key: String) -> ButtonState {
        if let value = content[key]{
            return value
        }else{
            return .none
        }
    }
    
    mutating func setValue(_ state: ButtonState, for key: String) {
        content[key] = state
    }
    
    func validat() {
        //
    }
    
    func isWin() -> Bool {
        for posibility in winningPosibilities {
            if content[posibility[0]] != nil{
                if content[posibility[0]] == content[posibility[1]],  content[posibility[1]] == content[posibility[2]]{
                    return true
                }
            }
        }
        return false
    }
}
