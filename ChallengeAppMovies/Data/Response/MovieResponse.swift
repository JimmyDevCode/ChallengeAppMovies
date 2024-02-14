//
//  MovieBasicDTO.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 13/02/24.
//

import Foundation

struct MovieResponse{
    let poster: String
    let name: String
    let rating: Double
    let releaseDate: String
    let summary: String
    
    init(domainModel: MovieResult, posterPath: String) {
        self.poster = posterPath
        self.name = domainModel.originalTitle
        self.rating = domainModel.voteAverage
        self.releaseDate = domainModel.releaseDate
        self.summary = domainModel.overview
    }
}
