//
//  ViewController.swift
//  ChallengeAppMovies
//
//  Created by Jimmy Ronaldo Macedo Pizango on 8/02/24.
//

import UIKit

protocol HomeViewType: AnyObject {
    
    func updateDataMovies(movies: [MovieResponse])
    func updateDataMoviesFiltered(movies: [MovieResponse])
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
        HomeConfigurator.createModuleHome(view: self)
        presenter?.getMovies(page: 1)
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
        let movie = listMovies[indexPath.row]
        presenter?.selectMovie(movie: movie)
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
    func updateDataMoviesFiltered(movies: [MovieResponse]) {
        listMovies = movies
    }
    
    func updateDataMovies(movies: [MovieResponse]) {
        listMovies = movies
    }
}

extension ViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Jimmy Mac")
        presenter?.searchMovie(name: searchText)
    }
}
