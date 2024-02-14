//
//  HomeInteractor.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 13/02/24.
//

import Foundation

//MARK: INTERACTOR
protocol HomeInteractorInputType{
    func getMovies(page: Int)
}

class HomeInteractor{
    var repository: MovieRepositoryType?
    weak var presenter: HomePresenterOuputType?
    private var movies: [MovieResponse] = []
    
    required init(repository: MovieRepositoryType, presenter: HomePresenterOuputType) {
        self.repository = repository
        self.presenter = presenter
    }
}

extension HomeInteractor: HomeInteractorInputType{
    func getMovies(page: Int) {
        Task{
            let result = await repository?.getMovie(page: page)
            let movieResponse = try? result?.get()
            Task{@MainActor in
                guard let movieResponse = movieResponse else{
                    return
                }
                print(movieResponse)
                self.movies = movieResponse
                presenter?.getDogsResponse(movies: self.movies )
            }
        }
    }
}
