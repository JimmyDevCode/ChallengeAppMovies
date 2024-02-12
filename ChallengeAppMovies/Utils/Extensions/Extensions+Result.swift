//
//  Extensions+Result.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 12/02/24.
//

import Foundation

extension Result {
    var failureValue: Error? {
        switch self{
        case .failure(let error):
            return error
        case .success:
            return nil
        }
    }
}
