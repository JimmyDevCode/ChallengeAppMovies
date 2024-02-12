//
//  CustomTableViewCellMovie.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 12/02/24.
//

import UIKit

class CustomTableViewCellMovie: UITableViewCell {
    
    @IBOutlet weak var nameMovieLabel: UILabel!
    @IBOutlet weak var genreMovieLabel: UILabel!
    
    static let identifier = "CustomTableViewCellMovie"
    
    static func nib() -> UINib{
        return UINib(nibName: "CustomTableViewCellMovie", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none
    }
    
    func setup(movie: moviePresentableItem) {
        nameMovieLabel.text = movie.name
        genreMovieLabel.text = movie.genre
    }
    
}

struct moviePresentableItem{
    let name: String
    let genre: String
    let rating: String
    let releaseDate: String
    let summary: String
    
    init(domainModel: MovieResult) {
        self.name = domainModel.originalTitle
        self.genre = domainModel.originalLanguage
        self.rating = domainModel.originalTitle
        self.releaseDate = domainModel.originalTitle
        self.summary = domainModel.originalTitle
    }
}
