//
//  HomeDetailPresenter.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 21/02/24.
//

import Foundation

protocol HomeDetailPresenterType{
    func getDetail()
}

class HomeDetailPresenter: HomeDetailPresenterType{
    private var movieDetail: MovieResponse
    weak var view: HomeViewDetailType?
    
    func getDetail() {
        view?.updateDetailMovie(movie: movieDetail)
    }
    required init(movieDetail: MovieResponse, view: HomeViewDetailType) {
        self.movieDetail = movieDetail
        self.view = view
    }
}
