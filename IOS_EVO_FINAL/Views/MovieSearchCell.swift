//
//  MovieSearchCell.swift
//  IOS_EVO_FINAL
//
//  Created by Plancquet Frederic on 10/11/2022.
//

import UIKit
import AlamofireImage

class MovieSearchCell: UITableViewCell {

    @IBOutlet weak var movieImg: UIImageView!
    @IBOutlet weak var moveReleaseDate: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(movie: Movie) {
        movieTitle.text = movie.title
        moveReleaseDate.text = movie.releaseDate
        
        if let movieImage = movie.posterPath, let url = URL(string:  "https://image.tmdb.org/t/p/w500\(movieImage)") {
            movieImg.af.setImage(withURL: url)

        }
        
        
    }
    
}
