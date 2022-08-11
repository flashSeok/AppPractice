//
//  ViewController.swift
//  TableViewPractice
//
//  Created by 김현석 on 2022/08/11.
//

import UIKit

// 테이블 뷰를 사용하려면 아래 UITableViewDataSource 프로토콜을 채택해야 함⭐️
class ViewController: UIViewController {

    //var moviesArray: [Movie] = []
    
    var movieDataManager = DataManager()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 테이블 뷰의 대리자를 뷰컨트롤러로 설정
        tableView.dataSource = self
        tableView.rowHeight = 120 // 셀의 높이 설정
    }
}



// MARK: - UITableViewDataSource 프로토콜 채택
extension ViewController: UITableViewDataSource {
    // 테이블 뷰가 뷰 컨트롤러한테 컨텐츠를 몇 개 표시해야 됨? 이라고 물어보면 리턴해주는 메서드 (반드시 구현해야 됨)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        
        return movieDataManager.getMovieData().count
    }
    
    
    // 몇번째 행에 있는 셀은 어떠한 방식으로 표시하면 됨? (반드시 구현해야 됨)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        
        // 메서드 자체 리턴값이 UITableViewCell로 되어있어서 MoiveCell로 타입캐스팅
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
//        indexPath.section // 테이블뷰를 그룹으로 만들었을때 몇번째 그룹의 번호(아이폰 기본설정화면이 여러 테이블뷰의 그룹으로 생성되어있음)
//        indexPath.row // 몇번째 행의 번호
       
        let array = movieDataManager.getMovieData()
        let movie = array[indexPath.row]
        
        cell.mainImageView.image = movie.movieImage
        cell.movieNameLabel.text = movie.movieName
        cell.descriptionLabel.text = movie.movieDescription
        
        // 셀 선택했을때 색상변경 = .gray가 기본 설정
        cell.selectionStyle = .none
                
        
        return cell
        
    }
    
}
