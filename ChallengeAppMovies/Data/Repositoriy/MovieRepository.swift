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
    func getMovie(page: Int) async -> Result<MovieResponseResult, MovieDomainError>
}

class MovieRepository: MovieRepositoryType{
    
    private let apiDataSource: APIMovieDataSource
    private let errorMapper: MovieDomainErrorMapper
    
    init(apiDataSource: APIMovieDataSource, errorMapper: MovieDomainErrorMapper) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
    }
    
    func getMovie(page: Int) async -> Result<MovieResponseResult, MovieDomainError> {
        
        let movieListResult = await apiDataSource.getMovie(page: page)
        
        guard case .success(let movieList) = movieListResult else {
            return .failure(errorMapper.map(error: movieListResult.failureValue as? HTTPClientError))
        }

        return .success(movieList)
    }
}

class MovieDomainErrorMapper{
    func map(error: HTTPClientError?) -> MovieDomainError{
        return .generic
    }
}
