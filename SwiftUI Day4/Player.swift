//
//  Player.swift
//  SwiftUI Day4
//
//  Created by tahani alrashidi on 8/28/20.
//  Copyright © 2020 Aldana Al-Rashidi. All rights reserved.
//

import Foundation

enum Player {
    case one
    case two
}

extension Player{
    var identity: String{
        switch self {
        case .one:
            return "X"
        default:
            return "O"
        }
    }
    
    mutating func toggle(){
        if self == .one{
            self = .two
        }else{
            self = .one
        }
    }
}
