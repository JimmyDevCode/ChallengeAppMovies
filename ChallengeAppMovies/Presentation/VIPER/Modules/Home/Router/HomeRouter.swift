//
//  HomeRouter.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 21/02/24.
//

import Foundation
import UIKit

protocol HomeRouterType{

    func navigateToHomeDetail(movie: MovieResponse)
    var view: UIViewController? {get set}
}

class HomeRouter: HomeRouterType{
    weak var view: UIViewController?
    func navigateToHomeDetail(movie: MovieResponse) {
        let detailMovie = HomeDetailConfigurator.createModuleDetail(movie: movie)
        view?.navigationController?.pushViewController(detailMovie, animated: true)
    }
}
