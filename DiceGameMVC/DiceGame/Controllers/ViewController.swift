//
//  ViewController.swift
//  DiceGame
//
//  Created by 김현석 on 2022/07/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    
    var diceManager = DiceManager()
    
    // 앱의 화면에 들어오면 가장 먼저 들어오는 함수
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstImageView.image = diceManager.getFirstDice()
        secondImageView.image = diceManager.getFirstDice()
    }
    

    @IBAction func rollButtonTapped(_ sender: UIButton) {
        
        // 첫번째 이미지뷰의 이미지를 랜덤으로 변경
        firstImageView.image = diceManager.getRandomDice()
        
        // 두번째 이미지뷰의 이미지를 랜덤으로 변경
        secondImageView.image = diceManager.getRandomDice()
    }

}

