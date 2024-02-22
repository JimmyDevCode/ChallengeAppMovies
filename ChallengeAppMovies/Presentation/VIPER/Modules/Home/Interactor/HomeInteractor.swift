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
    func searchMovie(name: String)
}

class HomeInteractor{
    var repository: MovieRepositoryType?
    weak var presenter: HomePresenterOuputType?
    private var movies: [MovieResponse] = []
    private var filteredMovies: [MovieResponse] = []
    
    required init(repository: MovieRepositoryType, presenter: HomePresenterOuputType) {
        self.repository = repository
        self.presenter = presenter
    }
}

extension HomeInteractor: HomeInteractorInputType{
    func searchMovie(name: String) {
        let filteredMovies = filterMoviesByName(movies: movies, name: name)
        presenter?.getSearchResult(movies: filteredMovies)
    }
    
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
                presenter?.getMoviesResponse(movies: self.movies )
            }
        }
    }
    
    private func filterMoviesByName(movies: [MovieResponse], name: String) -> [MovieResponse] {
        if name.isEmpty {
            return movies
        } else {
            let lowercasedName = name.lowercased()
            return movies.filter { movie in
                movie.name.lowercased().contains(lowercasedName)
            }
        }
    }
}
