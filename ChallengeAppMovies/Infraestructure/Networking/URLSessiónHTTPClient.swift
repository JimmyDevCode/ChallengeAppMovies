//
//  HTTPClient.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 9/02/24.
//

import Foundation

protocol HTTPClient{
    func makeRequest(endPoint: EndPoint, baseUrl: String) -> Result<Data, HTTPClientError>
}
