//
//  MovieResponseResult.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 9/02/24.
//

import Foundation

// MARK: - ResponseResultMovie
struct MovieResponseResult: Codable {
    let dates: MovieDate
    let page: Int
    let results: [MovieResult]
    let totalPages: Int
    let totalResults: Int

    enum CodingKeys: String, CodingKey {
        case dates = "dates"
        case page
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}
