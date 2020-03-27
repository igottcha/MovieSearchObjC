//
//  MovieTableViewCell.swift
//  MovieSearchObjC
//
//  Created by Chris Gottfredson on 3/27/20.
//  Copyright © 2020 Gottfredson. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    //MARK: - Methods
    
    func fetchPosterImage(movie: GTTMovie) {
        GTTMovieController.fetchPosterImage(movie) { (image) in
            DispatchQueue.main.async {
                self.posterImageView.image = image
            }
        }
    }
}
