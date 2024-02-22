//
//  HomePresenter.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 13/02/24.
//

import Foundation

protocol HomePresenterInputType{
    func getMovies(page: Int)
    func selectMovie(movie: MovieResponse)
    func searchMovie(name: String)
    
    var  interactor: HomeInteractorInputType? {get set}
    var router: HomeRouterType? {get set}
}

protocol HomePresenterOuputType: AnyObject {
    
    func getMoviesResponse(movies: [MovieResponse])
    func getSearchResult(movies: [MovieResponse])
    var view: HomeViewType? {get set}
    
}

protocol HomePresenterType: HomePresenterInputType, HomePresenterOuputType {}

class HomePresenter: HomePresenterType{
    
    var interactor: HomeInteractorInputType?
    var view: HomeViewType?
    var router: HomeRouterType?
    
    func getSearchResult(movies: [MovieResponse]) {
        view?.updateDataMovies(movies: movies)
    }
    
    func getMovies(page: Int) {
        interactor?.getMovies(page: page)
    }
    
    func selectMovie(movie: MovieResponse) {
        router?.navigateToHomeDetail(movie: movie)
    }

    func getMoviesResponse(movies: [MovieResponse]) {
        self.view?.updateDataMovies(movies: movies)
    }
    
    func searchMovie(name: String) {
        interactor?.searchMovie(name: name)
    }
    
}
