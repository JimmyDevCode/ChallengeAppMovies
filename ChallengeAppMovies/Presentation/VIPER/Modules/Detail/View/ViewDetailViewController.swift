//
//  ViewDetailViewController.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 13/02/24.
//

import UIKit
import SDWebImage

protocol HomeViewDetailType: AnyObject{
    
    func updateDetailMovie(movie: MovieResponse)
}

class ViewDetailViewController: UIViewController {


    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLevel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    var movie: MovieResponse?
    var presenter: HomeDetailPresenterType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getDetail()
    }

    func setup(movie: MovieResponse) {
        
        if let imageURL = URL(string: movie.poster){
            posterImageView.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "Placeholder_view_vector.svg"))
        }else {
            posterImageView.image = UIImage(named: "Placeholder_view_vector.svg")
            
        }
        
        nameLabel.text = movie.name
        ratingLevel.text = "\(movie.rating)"
        releaseDateLabel.text = movie.releaseDate
        summaryLabel.text = movie.summary
    }
    
    
    
}

extension ViewDetailViewController: HomeViewDetailType{
    func updateDetailMovie(movie: MovieResponse) {
        self.movie = movie
        setup(movie: movie)
    }
}
