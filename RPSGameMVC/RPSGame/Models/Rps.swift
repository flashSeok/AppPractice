//
//  Rps.swift
//  RPSGame
//
//  Created by 김현석 on 2022/07/27.
//

import UIKit

// 원시값(raw value)
enum Rps: Int {
    case rock // 0
    case paper // 1
    case scissors // 2
    case ready
    
    var rpsInfo: (image: UIImage, name: String) {
        switch self {
        case .ready:
            return (#imageLiteral(resourceName: "ready"), "준비")
        case .rock:
            return (#imageLiteral(resourceName: "rock"), "바위")
        case .paper:
            return (#imageLiteral(resourceName: "paper"), "보")
        case .scissors:
            return (#imageLiteral(resourceName: "scissors"), "가위")
        }
    }
}
