//
//  ChallengeAppMoviesTests.swift
//  ChallengeAppMoviesTests
//
//  Created by Jimmy Ronaldo Macedo Pizango on 8/02/24.
//

import XCTest
@testable import ChallengeAppMovies

final class ChallengeAppMoviesTests: XCTestCase {
    
    func test_execute_sucesfully_return_repository_nomEmpty_array() async throws{
        let sut = MovieRepository(apiDataSource: APIMovieDataSource(htppClient: URLSessiónHTTPClient(requestMaker: URLSessionRequestMaker(), errorResolver: URLSessionErrorResolver())), errorMapper: MovieDomainErrorMapper())
        
        //WHEN
        let capturedResult = await sut.getMovie(page: 1)
        let capturedMovieList = try XCTUnwrap(capturedResult.get())
        //THEN
        XCTAssertEqual(capturedMovieList.count, 20)
        XCTAssertTrue(capturedMovieList.contains(where: { $0.poster == "https://image.tmdb.org/t/p/w500/rULWuutDcN5NvtiZi4FRPzRYWSh.jpg" }))
        
    }
}

