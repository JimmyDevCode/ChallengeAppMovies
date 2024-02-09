//
//  APIMovieDataSource.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 9/02/24.
//

import Foundation

protocol APIMovieDataSourceType{
    func getMovie() async -> Result<MovieResponseResult, HTTPClientError>
}

class APIMovieDataSource: APIMovieDataSourceType{
    private let htppClient: HTTPClient
    
    init(htppClient: HTTPClient) {
        self.htppClient = htppClient
    }
    
    func getMovie() async -> Result<MovieResponseResult, HTTPClientError> {
        let endpoint = EndPoint(path: "upcoming?api_key=e14c88f33e2d282127291cd7327701e3", queryParams: [:], method: .get)
        
        let result = htppClient.makeRequest(endPoint: endpoint, baseUrl: "https://api.themoviedb.org/3/movie/")
        
        guard case .success(let data) = result else {
            guard case .failure(let error) = result else{
                return .failure(.generic)
            }
            return .failure(error)
        }
        guard let movieList = try? JSONDecoder().decode(MovieResponseResult.self, from: data) else {
            return .failure(.parsingError)
        }
        
        return .success(movieList)
    }
    
    
}
