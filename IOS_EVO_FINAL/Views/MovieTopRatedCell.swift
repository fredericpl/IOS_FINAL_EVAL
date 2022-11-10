//
//  MovieTopRatedCell.swift
//  IOS_EVO_FINAL
//
//  Created by Plancquet Frederic on 10/11/2022.
//

import UIKit
import AlamofireImage


class MovieTopRatedCell: UICollectionViewCell {

    @IBOutlet weak var movieAvgVote: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 3) - 20).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: (180)).isActive = true
        
        movieImg.layer.cornerRadius = 8
        movieImg.layoutMargins = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        movieAvgVote.layer.cornerRadius = movieAvgVote.frame.size.height / 2
        movieAvgVote.clipsToBounds = true
    }
    
    func setupCell(movie: Movie) {
        
        movieAvgVote.text = movie.voteAverage.description
        
        if let movieImage = movie.posterPath, let url = URL(string:  "https://image.tmdb.org/t/p/w500\(movieImage)") {
            movieImg.af.setImage(withURL: url)

        }
        
        
    }

}
