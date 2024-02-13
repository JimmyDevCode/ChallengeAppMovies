//
//  HomePresenter.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 13/02/24.
//

import Foundation

protocol HomePresenterInputType{
    func getMovies(page: Int)
    func selectMovie(_ movie: MovieResponse)
    var interactor: HomeInteractorInputType? {get set}
    //var router: HomeRouterType? {get set}
}

protocol HomePresenterOuputType: AnyObject {
    
    func getDogsResponse(movies: [MovieResponse])
    var view: HomeViewType? {get set}
    
}

protocol HomePresenterType: HomePresenterInputType, HomePresenterOuputType {}

class HomePresenter: HomePresenterType{
    
    var interactor: HomeInteractorInputType?
    var view: HomeViewType?
    
    func getMovies(page: Int) {
        interactor?.getMovies(page: page)
    }
    
    func selectMovie(_ movie: MovieResponse) {
       //
    }

    func getDogsResponse(movies: [MovieResponse]) {
        //TODO:
        //self.view?.updateDataDogs(movies: movies)
    }
}
