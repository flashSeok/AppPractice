//
//  UpDownManager.swift
//  UpDownGameAppMVC
//
//  Created by 김현석 on 2022/08/06.
//

import UIKit


class UpDownManager {
    
    // 컴퓨터가 랜덤으로 숫자 선택.
    private var comNumber = Int.random(in: 1...10)
    
    // 내 선택 저장.
    private var myNumber = 1
    
    func resetNum() {
        comNumber = Int.random(in: 1...10)
        myNumber = 1
    }
    
    func setUsersNum(num: Int) {
        myNumber = num
    }
    
    func getUpDownResult() -> String {
        if comNumber > myNumber {
            return "Up"
        } else if comNumber < myNumber {
            return "Down"
        } else {
            return "Bingo😎"
        }
    }
    
    
    
}

