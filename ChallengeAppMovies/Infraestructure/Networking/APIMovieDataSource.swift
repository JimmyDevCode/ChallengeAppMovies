//
//  APIMovieDataSource.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 9/02/24.
//

import Foundation

protocol APIMovieDataSourceType{
    func getMovie(page: Int) async -> Result<MovieResponseResult, HTTPClientError>
}

class APIMovieDataSource: APIMovieDataSourceType{
    private let htppClient: HTTPClient
    
    init(htppClient: HTTPClient) {
        self.htppClient = htppClient
    }
    
    func getMovie(page: Int) async -> Result<MovieResponseResult, HTTPClientError> {
        let path = Constants.getMoviesUpcoming + Constants.ByPageURL + String(page) + "&" + Constants.themoviedbAPIKey
        let baseURL = Constants.baseURL
        let endpoint = EndPoint(path: path, queryParams: [:], method: .get)
        
        let result = await htppClient.makeRequest(endPoint: endpoint, baseUrl: baseURL)
        
        guard case .success(let data) = result else {
            guard case .failure(let error) = result else{
                return .failure(.generic)
            }
            return .failure(error)
        }
        guard let movieList = try? JSONDecoder().decode(MovieResponseResult.self, from: data) else {
            return .failure(.parsingError)
        }
        print("RESPONSE: -> ", movieList)
        return .success(movieList)
    }
    
    
}
