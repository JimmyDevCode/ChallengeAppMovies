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
    
    var  interactor: HomeInteractorInputType? {get set}
    var router: HomeRouterType? {get set}
}

protocol HomePresenterOuputType: AnyObject {
    
    func getDogsResponse(movies: [MovieResponse])
    var view: HomeViewType? {get set}
    
}

protocol HomePresenterType: HomePresenterInputType, HomePresenterOuputType {}

class HomePresenter: HomePresenterType{

    var interactor: HomeInteractorInputType?
    var view: HomeViewType?
    var router: HomeRouterType?
    
    func getMovies(page: Int) {
        interactor?.getMovies(page: page)
    }
    
    func selectMovie(movie: MovieResponse) {
        router?.navigateToHomeDetail(movie: movie)
    }

    func getDogsResponse(movies: [MovieResponse]) {
        self.view?.updateDataMovies(movies: movies)
    }
}
