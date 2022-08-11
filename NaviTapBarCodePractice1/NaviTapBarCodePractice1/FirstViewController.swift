//
//  FirstViewController.swift
//  NaviTapBarCodePractice1
//
//  Created by 김현석 on 2022/08/10.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeNavigationBar()
    }
    
    
    // 내비게이션 바를 코드로 설정하기
    func makeNavigationBar() {
        view.backgroundColor = .gray
        
        let navigationBarAppearce = UINavigationBarAppearance()
        navigationBarAppearce.configureWithOpaqueBackground()
        navigationController?.navigationBar.standardAppearance = navigationBarAppearce
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearce
        navigationController?.navigationBar.tintColor = .blue
        
        navigationItem.scrollEdgeAppearance = navigationBarAppearce
        navigationItem.standardAppearance = navigationBarAppearce
        navigationItem.compactAppearance = navigationBarAppearce
        
        navigationController?.setNeedsStatusBarAppearanceUpdate()
        
        navigationController?.navigationBar.isTranslucent = false
        //navigationController?.navigationBar.backgroundColor = .white
        
        title = "Main"
    }
    
    
}
