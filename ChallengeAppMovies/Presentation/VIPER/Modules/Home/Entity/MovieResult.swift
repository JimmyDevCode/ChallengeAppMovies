//
//  MovieResult.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 9/02/24.
//

import Foundation

// MARK: - Result
struct MovieResult: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
}

extension MovieResult {
    static func random() -> MovieResult {
        return MovieResult(
            adult: Bool.random(),
            backdropPath: UUID().uuidString,
            genreIDS: [Int.random(in: 1...10), Int.random(in: 1...10)], // Example: Random genre IDs between 1 and 10
            id: Int.random(in: 1...1000),
            originalLanguage: ["en", "es", "fr"].randomElement() ?? "en", // Example: Random language
            originalTitle: UUID().uuidString,
            overview: "Random overview text",
            popularity: Double.random(in: 0.0...100.0),
            posterPath: UUID().uuidString,
            releaseDate: "2024-02-22", // Example: Fixed release date
            title: UUID().uuidString,
            video: Bool.random(),
            voteAverage: Double.random(in: 0.0...10.0),
            voteCount: Int.random(in: 0...10000)
        )
    }
}
