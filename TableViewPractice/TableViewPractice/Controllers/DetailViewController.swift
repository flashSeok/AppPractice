//
//  DetailViewController.swift
//  TableViewPractice
//
//  Created by 김현석 on 2022/08/11.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var movieData: Movie?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMovieDetail()
    }
    
    
    func getMovieDetail() {
        mainImageView.image = movieData?.movieImage
        movieNameLabel.text = movieData?.movieName
        descriptionLabel.text = movieData?.movieDescription

    }
    


}
