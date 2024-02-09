//
//  HTTPClient.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 9/02/24.
//

import Foundation

protocol HTTPClient{
    func makeRequest(endPoint: EndPoint, baseUrl: String) async -> Result<Data, HTTPClientError>
}

class URLSessionRequestMaker{
    
    func url(endpoint: EndPoint, baseURL: String) -> URL? {
        var urlComponents = URLComponents(string: baseURL + endpoint.path)
        let url = urlComponents?.url
        return url
    }
}

class URLSessiónHTTPClient: HTTPClient{
    
    let session: URLSession
    let requestMaker: URLSessionRequestMaker
    let errorResolver: URLSessionErrorResolver
    
    init(session: URLSession = .shared, requestMaker: URLSessionRequestMaker, errorResolver: URLSessionErrorResolver) {
        self.session = session
        self.requestMaker = requestMaker
        self.errorResolver = errorResolver
    }
    
    func makeRequest(endPoint: EndPoint, baseUrl: String) async -> Result<Data, HTTPClientError> {
        
        guard let url = requestMaker.url(endpoint: endPoint, baseURL: baseUrl) else {
            return .failure(.urlError)
        }
        do {
            let result = try await session.data(from: url)
            
            guard let response = result.1 as? HTTPURLResponse else {
                return .failure(.responseError)
            }
            guard response.statusCode == 200 else {
                return .failure(errorResolver.resolve(statusCode: response.statusCode))
            }
            
            return .success(result.0)
            
            
        }catch{
            return .failure(.generic)
        }
    }
}
