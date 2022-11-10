//
//  MovieTopRatedController.swift
//  IOS_EVO_FINAL
//
//  Created by Plancquet Frederic on 10/11/2022.
//

import UIKit

class MovieTopRatedController: UIViewController {

    
    private var movies = [Movie]()
    private let apiServices = APIServices()
    
    @IBOutlet weak var movieTopRatedCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        movieTopRatedCollectionView.delegate = self
        movieTopRatedCollectionView.dataSource = self
        movieTopRatedCollectionView.register(UINib(nibName: "MovieTopRatedCell", bundle: nil), forCellWithReuseIdentifier: "MovieTopRatedCell")
        
        getDatas()
        
    }
    
    @objc private func getDatas() {

        let url = "https://api.themoviedb.org/3/discover/movie?api_key=1289bdc96c0e3bf709e4789f7a01faf9&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate"
        
        
        
        apiServices.fetchMovie(url: url){ [weak self] result in
            guard let self = self else { return}
            
            switch result {
                
            case .success(let movieModel):
                self.movies = movieModel.results
                self.movieTopRatedCollectionView.reloadData()
            case .failure(let error):
                print(error.errorDescription ?? "unknown error")
            }
            
        }

    }

    
    
}

extension MovieTopRatedController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count / 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = movieTopRatedCollectionView.dequeueReusableCell(withReuseIdentifier: "MovieTopRatedCell", for: indexPath) as? MovieTopRatedCell else { return UICollectionViewCell() }
        
        cell.setupCell(movie: movies[indexPath.row] )
        
        return cell
    }
    
    
}
