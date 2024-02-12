//
//  ViewController.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 8/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var listMovies: [moviePresentableItem] = []{
        didSet{
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(CustomTableViewCellMovie.nib(), forCellReuseIdentifier: CustomTableViewCellMovie.identifier)
        
        
        let api = APIMovieDataSource(htppClient: URLSessiónHTTPClient(requestMaker: URLSessionRequestMaker(), errorResolver: URLSessionErrorResolver()))
        
        Task{
            let result = await api.getMovie(page: 1)
            let movieResponse = try? result.get()
            print(api)
            Task{@MainActor in
                guard let movieResponse = movieResponse else{
                    return
                }
                let presetableItems = movieResponse.results.map{movie in
                    return moviePresentableItem(domainModel: movie)
                }
                
                self.listMovies = presetableItems
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCellMovie.identifier, for: indexPath) as? CustomTableViewCellMovie else {
            return UITableViewCell()
        }
        
        let movie = listMovies[indexPath.row]
        cell.setup(movie: movie)
        
        return cell
    }
}
