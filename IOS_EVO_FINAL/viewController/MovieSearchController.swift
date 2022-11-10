//
//  MovieSearchController.swift
//  IOS_EVO_FINAL
//
//  Created by Plancquet Frederic on 10/11/2022.
//

import UIKit

class MovieSearchController: UIViewController {
    
    private var movies = [Movie]()
    private let apiServices = APIServices()

    @IBOutlet weak var movieSearchField: UITextField!
    @IBOutlet weak var movieSearchTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieSearchTableView.dataSource = self
        movieSearchTableView.delegate = self
        movieSearchTableView.register(UINib(nibName: "MovieSearchCell", bundle: nil), forCellReuseIdentifier: "MovieSearchCell")
        
        getDatas()
        
        

        
    }
    
    @objc private func getDatas() {

        let url = "https://api.themoviedb.org/3/search/movie?api_key=1289bdc96c0e3bf709e4789f7a01faf9&language=en-US&page=1&include_adult=false&query=star"
        
        apiServices.fetchMovie(url: url){ [weak self] result in
            guard let self = self else { return}
            
            switch result {
                
            case .success(let movieModel):
                self.movies = movieModel.results
                self.movieSearchTableView.reloadData()
            case .failure(let error):
                print(error.errorDescription ?? "unknown error")
            }
            
        }

    }
}

extension MovieSearchController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = movieSearchTableView.dequeueReusableCell(withIdentifier: "MovieSearchCell", for: indexPath) as? MovieSearchCell else { return UITableViewCell() }
        
        cell.setupCell(movie: movies[indexPath.row] )
        
        return cell
      
    }
    
    
}
