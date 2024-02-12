//
//  HTTPClientError.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 9/02/24.
//

import Foundation

enum HTTPClientError: Error{
    case clientError(Int)
    case serverError(Int)
    case generic
    case parsingError
    case urlError
    case responseError
    case invalidApiKey(Int)
}
