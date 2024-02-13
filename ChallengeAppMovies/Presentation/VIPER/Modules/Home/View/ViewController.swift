//
//  ViewController.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 8/02/24.
//

import UIKit

protocol HomeViewType: AnyObject {
    
    func updateDataMovies(movies: [MovieResponse])
}
class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var listMovies: [MovieResponse] = []{
        didSet{
            tableView.reloadData()
        }
    }
    var presenter: HomePresenterInputType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        
        presenter?.getMovies(page: 1)
        let repository = MovieRepository(apiDataSource: APIMovieDataSource(htppClient: URLSessiónHTTPClient(requestMaker: URLSessionRequestMaker(), errorResolver: URLSessionErrorResolver())), errorMapper: MovieDomainErrorMapper())
        
        Task{
            let result = await repository.getMovie(page: 1)
            let movieResponse = try? result.get()
            print(result)
            Task{@MainActor in
                guard let movieResponse = movieResponse else{
                    return
                }
                
                self.listMovies = movieResponse
                print(listMovies)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewDetail = storyBoard.instantiateViewController(withIdentifier: "ViewDetail") as! ViewDetailViewController
        viewDetail.title = listMovies[indexPath.row].name
        let movie = listMovies[indexPath.row]
        viewDetail.movie = movie
        navigationController?.pushViewController(viewDetail, animated: true)
        ///navegamos a la vista detalle
        presenter?.selectMovie(movie)
    }
}

extension ViewController{
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCellMovie.nib(), forCellReuseIdentifier: CustomTableViewCellMovie.identifier)
    }
}

extension ViewController: HomeViewType{
    func updateDataMovies(movies: [MovieResponse]) {
        listMovies = movies
    }
}
