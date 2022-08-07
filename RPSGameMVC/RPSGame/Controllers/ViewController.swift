//
//  ViewController.swift
//  RPSGame
//
//  Created by 김현석 on 2022/07/27.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    var rpsManager = RPSManager()
    
    // 함수 / 메서드
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        // 1) 첫번째/두번째 이미지뷰에 준비(묵) 이미지를 띄워야 함
        comImageView.image = rpsManager.getReady().rpsInfo.image
        myImageView.image = rpsManager.getReady().rpsInfo.image
        
        // 2) 첫번째/두번째 레이블에 "준비"라고 문자열을 띄워야함.
        comChoiceLabel.text = rpsManager.getReady().rpsInfo.name
        myChoiceLabel.text = rpsManager.getReady().rpsInfo.name
    }
    
    
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // 가위/바위/보(enum)를 선택해서 그 정보를 저장해야됨.
        
        // 버튼의 문자를 가져옴
        // 가위 / 바위/ 보를 나타냄 currentTitle은 옵셔널이라 바인딩해줘야함.
        guard let title = sender.currentTitle else { return }
        print(title)

        // 가져온 문자를 분기처리해서 myChoice변수에 열거형 형태로 저장
        rpsManager.userGetSelected(name: title)
        
        
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 1) 컴퓨터가 랜덤 선택한 것을 이미지 뷰에 표시
        // 2) 컴퓨터가 랜덤 선택한 것을 레이블에 표시
        comImageView.image = rpsManager.getComputerRPS().rpsInfo.image
        comChoiceLabel.text = rpsManager.getComputerRPS().rpsInfo.name
        
        // 3) 내가 선택한 것을 이미지 뷰에 표시
        // 4) 내가 선택한 것을 레이블에 표시
        myImageView.image = rpsManager.getUserRps().rpsInfo.image
        myChoiceLabel.text = rpsManager.getUserRps().rpsInfo.name
               
        // 5) 컴퓨터가 선택한 것과 내가 선택한 것을 비교해서 이겼는지/졌는지 판단 후 표시
        mainLabel.text = rpsManager.getRpsResult()
       
        
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        // 1) 컴퓨터가 다시 처음 준비 이미지뷰에 표시
        // 2) 컴퓨터가 다시 처음 준비 문자열 표시
        comImageView.image = rpsManager.getReady().rpsInfo.image
        comChoiceLabel.text = rpsManager.getReady().rpsInfo.name
        
        
        // 3) 내 선택 이미지뷰에도 준비 이미지뷰에 표시
        // 4) 내 선택 레이블에도 준비 문자열을 표시
        myImageView.image = rpsManager.getReady().rpsInfo.image
        myChoiceLabel.text = rpsManager.getReady().rpsInfo.name
        
        
        // 5) 메인 레이블에도 "선택하세요"라고 표시
        mainLabel.text = "선택하세요"
        
        
        // 6) 컴퓨터가 다시 랜덤 가위/바위/보를 선택하고 저장
        rpsManager.allReset()
        
        
    }
    
    
}
