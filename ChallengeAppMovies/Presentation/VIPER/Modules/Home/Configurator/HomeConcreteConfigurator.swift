//
//  HomeConcreteConfigurator.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 14/02/24.
//

import Foundation

protocol HomeConfiguratorType{

    func createRepository() -> MovieRepositoryType
    func createPresenter() -> HomePresenterType
    func createInteractor(repository: MovieRepositoryType, presenter: HomePresenterType) -> HomeInteractorInputType
    func createRouter() -> HomeRouterType

}

class HomeConcreteConfigurator: HomeConfiguratorType{

    func createRepository() -> MovieRepositoryType {
        let repository = MovieRepository(apiDataSource: APIMovieDataSource(htppClient: URLSessiónHTTPClient(requestMaker: URLSessionRequestMaker(), errorResolver: URLSessionErrorResolver())), errorMapper: MovieDomainErrorMapper())
        return repository
    }
    
    func createPresenter() -> HomePresenterType {
        return HomePresenter()
    }
    
    func createInteractor(repository: MovieRepositoryType, presenter: HomePresenterType) -> HomeInteractorInputType {
        return HomeInteractor(repository: repository, presenter: presenter)
    }
    
    func createRouter() -> HomeRouterType {
        return HomeRouter()
    }
    
}
