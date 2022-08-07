//
//  RPSManager.swift
//  RPSGameMVC
//
//  Created by 김현석 on 2022/08/06.
//

import UIKit


class RPSManager {
    
    var comChoice: Rps = Rps(rawValue: Int.random(in: 1...3))!
    var myChoice: Rps = Rps(rawValue: Int.random(in: 1...3))!
    
    func getReady() -> Rps {
        return Rps.ready
    }
    
    func getUserRps() -> Rps {
        return myChoice
    }
    
    func getComputerRPS() -> Rps {
        return comChoice
    }
    
    func userGetSelected(name: String) {
        switch name {
        case "가위":
            // 가위 열거형을 만들어서 저장.
            myChoice = Rps.scissors
        case "바위":
            // 바위 열거형을 만들어서 저장.
            myChoice = Rps.rock
        case "보":
            // 보 열거형을 만들어서 저장.
            myChoice = Rps.paper
        default:
            myChoice = Rps.rock
            break
        }
    }
    
    func getRpsResult() -> String {
        if comChoice == myChoice {
            return "비겼다"
        } else if comChoice == .rock && myChoice == .paper {
            return "이겼다"
        } else if comChoice == .paper && myChoice == .scissors {
            return "이겼다"
        } else if comChoice == .scissors && myChoice == .rock {
            return "이겼다"
        } else {
            return "졌다"
        }
    }
    
    func allReset() {
        comChoice = Rps(rawValue: Int.random(in: 1...3))!
        myChoice = Rps(rawValue: Int.random(in: 1...3))!
    }
    
    
}
