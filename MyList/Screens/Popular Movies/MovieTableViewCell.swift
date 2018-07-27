//
//  MovieTableViewCell.swift
//  MyList
//
//  Created by Carlos Villanueva Ousset on 7/26/18.
//  Copyright © 2018 Carlos Villanueva Ousset. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with movie: Movie) {
        resetUI()
        titleLabel.text = movie.title
    }

    func resetUI() {
        titleLabel.text = nil;
    }
}
