//
//  ViewController.swift
//  TimerApp
//
//  Created by 김현석 on 2022/07/28.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    weak var timer : Timer?
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    func configureUI() {
        
        mainLabel.text = "초를 선택하세요"
        slider.setValue(0.5, animated: true)
        
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        // 슬라이더의 밸류 값을 가지고 메인 레이블의 텍스트를 세팅.
        let seconds = Int(slider.value * 60)
        // print(seconds)
        
        mainLabel.text = "\(seconds) 초"
        
        number = seconds
        
    }
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        
        
        // 타이머가 이미 존재하면 비활성화 시킴.
        timer?.invalidate()
        
        // 1) 번째 방법 (함수를 이용한 방법)
        // target: self에서 self는  11번째 줄 ViewController를 의미함
        // selector는 해당 인스턴스(ViewController)가 가지고 있는 doSomethingAfter1Second 함수를 실행시킨다는 의미
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self
                                     , selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true)
        // 반복할 코드 작성.
        

        // 2번째 방법 (클로저를 이용한 방법)
        // 1초씩 지나갈 때마다 무언가를 실행
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [self] _ in // [self]는 timer를 의미
//
//            // 반복할 코드 작성.
//
//            if number > 0 {
//                // 1초마다 number 1씩 줄이기
//                number -= 1
//
//                // 슬라이더 줄이기
//                slider.value = Float(number) / Float(60)
//                // 레이블 표시 다시 하기.
//                mainLabel.text = "\(number) 초"
//
//            } else {
//                number = 0
//                mainLabel.text = "초를 선택하세요"
//
//                timer?.invalidate()
//
//                // number가 0이 되면 소리까지 나게 하기.
//                // create a sound ID, in this case its the tweet sound.
//                let systemSoundID: SystemSoundID = 1016
//
//                // to play sound
//                AudioServicesPlaySystemSound(systemSoundID)
//
//            }
//        })
        
    }
    
    @objc func doSomethingAfter1Second() {
        if number > 0 {
            // 1초마다 number 1씩 줄이기
            number -= 1
            
            // 슬라이더 줄이기
            slider.value = Float(number) / Float(60)
            // 레이블 표시 다시 하기.
            mainLabel.text = "\(number) 초"
            
        } else {
            number = 0
            mainLabel.text = "초를 선택하세요"
            
            // 타이머 비활성화.
            timer?.invalidate()
            
            // number가 0이 되면 소리까지 나게 하기.
            // create a sound ID, in this case its the tweet sound.
            let systemSoundID: SystemSoundID = 1016
            
            // to play sound
            AudioServicesPlaySystemSound(systemSoundID)
            
        }
        
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        // 초기화 세팅.
        // 슬라이더 가운데 설정.
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
        number = 0
        
        timer?.invalidate()
        
        // slider 기본 값은 최소0 최대 1임.(0 ~ 1) 그래서 가운데는 0.5
        slider.setValue(0.5, animated: true)
        
    }
    
}

