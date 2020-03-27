//
//  MovieListTableViewController.swift
//  MovieSearchObjC
//
//  Created by Chris Gottfredson on 3/27/20.
//  Copyright © 2020 Gottfredson. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController, UISearchBarDelegate {

    //MARK: - Outlets
    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    //MARK: - Properties
    
    var movies: [GTTMovie] = []
    {
        didSet
        {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieSearchBar.delegate = self
        tableView.reloadData()
    }

    //MARK: - Actions
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else { return }
        GTTMovieController.fetchMovie(searchTerm) { (movies) in
            DispatchQueue.main.async {
                guard let movies = movies else { return }
                self.title = "Showing results for \"\(searchBar.text ?? "")\""
                self.movies = movies
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        let movie = movies[indexPath.row]
        
        cell.titleLabel.text = movie.title
        cell.ratingLabel.text = "\(movie.rating)"
        cell.overviewLabel.text = movie.overview
        cell.fetchPosterImage(movie: movie)
        
        return cell
    }
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
}
