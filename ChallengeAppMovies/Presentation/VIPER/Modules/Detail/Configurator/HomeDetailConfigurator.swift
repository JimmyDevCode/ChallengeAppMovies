//
//  HomeDetailConfigurator.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 21/02/24.
//

import Foundation
import UIKit

class HomeDetailConfigurator{
    
    static func createModuleDetail(movie: MovieResponse) -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ViewDetail") as! ViewDetailViewController
        let presenter =  HomeDetailPresenter(movieDetail: movie, view: view)
        view.presenter = presenter
        return view
    }
}
