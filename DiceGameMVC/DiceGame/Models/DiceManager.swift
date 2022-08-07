//
//  DiceManager.swift
//  DiceGameMVC
//
//  Created by 김현석 on 2022/08/06.
//

import UIKit



class DiceManager {
    
    private var diceArray: [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    
    func getRandomDice() -> UIImage {
        return diceArray.randomElement()!
    }
    
    func getFirstDice() -> UIImage {
        return diceArray[0]
    }
    
}
