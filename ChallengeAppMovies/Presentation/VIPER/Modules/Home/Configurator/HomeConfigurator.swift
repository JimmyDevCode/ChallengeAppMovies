//
//  HomeConfigurator.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 13/02/24.
//

import Foundation

class HomeConfigurator {
    
    static func createModuleHome(view: ViewController){
        let build: HomeConfiguratorType
        let buildConfig = HomeConcreteConfigurator()
        build = buildConfig
        let repository = build.createRepository()
        var presenter = build.createPresenter()
        let interactor = build.createInteractor(repository: repository, presenter: presenter)
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        view.presenter = presenter
        router.view = view
    }
}
