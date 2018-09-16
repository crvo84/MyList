//
//  MovieTableViewCell.swift
//  MyList
//
//  Created by Carlos Villanueva Ousset on 7/26/18.
//  Copyright © 2018 Carlos Villanueva Ousset. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        initialSetup()
    }

    // MARK: Setup

    func initialSetup() {
        selectionStyle = .none
        contentView.backgroundColor = .clear
        Theme.CornerRadius.standard.apply(to: shadowView)
        // TODO: Create Theme.Label configured with Theme.Font, Theme.Color
        titleLabel.textColor = .white
    }

    // MARK: - Update

    func configure(with movie: Movie) {
        resetUI()
        titleLabel.text = movie.title
    }

    func resetUI() {
        titleLabel.text = nil
        posterImageView.image = nil
    }
}
