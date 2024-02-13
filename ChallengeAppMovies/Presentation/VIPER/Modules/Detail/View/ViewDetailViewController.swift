//
//  ViewDetailViewController.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 13/02/24.
//

import UIKit
import SDWebImage

class ViewDetailViewController: UIViewController {


    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingLevel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    var movie: MovieResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie {
            setup(movie: movie)
        }
    }

    func setup(movie: MovieResponse) {
        
        if let imageURL = URL(string: movie.poster){
            posterImageView.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholder"))
        }else {
            posterImageView.image = UIImage(named: "placeholder")
            
        }
        
        nameLabel.text = movie.name
        ratingLevel.text = "\(movie.rating)"
        releaseDateLabel.text = movie.releaseDate
        summaryLabel.text = movie.summary
    }
    
    
    
}
