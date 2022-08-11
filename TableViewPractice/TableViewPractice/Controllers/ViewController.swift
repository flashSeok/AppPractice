//
//  ViewController.swift
//  TableViewPractice
//
//  Created by 김현석 on 2022/08/11.
//

import UIKit

// 테이블 뷰를 사용하려면 아래 UITableViewDataSource 프로토콜을 채택해야 함⭐️
class ViewController: UIViewController {

    // 테이블뷰의 데이터를 표시하기 위한 배열
    var moviesArray: [Movie] = []
    
    // MVC패턴을 위한 데이터 매니저 (배열관리 - 데이터)
    var movieDataManager = DataManager()
       
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        setUpDatas()
        
    }
    
    func setUpTableView() {
        // 테이블 뷰의 대리자를 뷰컨트롤러로 설정
        tableView.dataSource = self
        tableView.rowHeight = 120 // 셀의 높이 설정
        
        tableView.delegate = self
        
        title = "영화목록"
    }
    
    // 데이터 받아서 뷰컨의 배열에 저장
    func setUpDatas() {
        movieDataManager.makeMovieData()
        moviesArray = movieDataManager.getMovieData()
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        print(#function)
        
        movieDataManager.updateMovieData()
        tableView.reloadData()
    }
    
    
    
}



// MARK: - UITableViewDataSource 프로토콜 채택(테이블뷰의 구성)
extension ViewController: UITableViewDataSource {
    // 1) 테이블 뷰가 뷰 컨트롤러한테 컨텐츠를 몇 개 표시해야 됨? 이라고 물어보면 리턴해주는 메서드 (반드시 구현해야 됨)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        
        return movieDataManager.getMovieData().count
    }
    
    
    // 2) 셀의 구성(셀에 표시하고자 하는 데이터 표시)을 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        
        // (힙에 올라간) 재사용 가능한 셀을 꺼내서 사용하는 메서드
        // 메서드 자체 리턴값이 UITableViewCell로 되어있어서 MoiveCell로 타입캐스팅(사전에 셀을 등록하는 과정이 내부 메커니즘에 존재)
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


// MARK: - UITableViewDelegate 프로토콜 채택(동작 - 테이블뷰에서 일어나는 일)
extension ViewController: UITableViewDelegate {
    
    // 테이블 뷰 안에 어떤 특정한 행이 선택됐을 때 어떤 동작을 할 것인지 뷰컨트롤러에게 물어봄
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        
        // 다음 화면으로 전달(세그웨이 실행)
        performSegue(withIdentifier: "toDetail", sender: indexPath) // sender는 아래 prepare sender로 보내줌.
        
    }
    
    
    // prepare 세그웨이(데이터 전달)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
            
            let array = movieDataManager.getMovieData()
            
            // 위 tableView메서드의 sender(indexPath)를 받아와서 타입캐스팅
            let indexPath = sender as! IndexPath
            
            detailVC.movieData = array[indexPath.row]
    
        }
    }
    
    
    
}
