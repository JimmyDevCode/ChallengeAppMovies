//
//  MovieRepository.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 12/02/24.
//
import Foundation

enum MovieDomainError: Error {
    case generic
}

protocol MovieRepositoryType {
    func getMovie() async -> Result<MovieResponseResult, MovieDomainError>
}

class MovieRepository: MovieRepositoryType{
    
    private let apiDataSource: APIMovieDataSource
    
    init(apiDataSource: APIMovieDataSource) {
        self.apiDataSource = apiDataSource
    }
    
    func getMovie() async -> Result<MovieResponseResult, MovieDomainError> {
        
        let movieListResult = await apiDataSource.getMovie()
        
        guard case .success(let movieList) = movieListResult else {
            guard case .failure(let error) = movieListResult else {
                return .failure(.generic)
            }

            return .failure(error)
        }

        return .success(movieList)
    }
    
    
}

