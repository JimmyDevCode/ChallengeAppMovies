//
//  URLSessionErrorResolver.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 9/02/24.
//

import Foundation

class URLSessionErrorResolver{
    func resolve(statusCode: Int) -> HTTPClientError{
        
        guard statusCode == 7 else{
            return .invalidApiKey
        }
        
        guard statusCode < 500 else {
            return .clientError
        }
        
        return .serverError
    }
    
    func resolve(error: Error) -> HTTPClientError{
        return .generic
    }
}
