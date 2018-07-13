//
//  Movie.swift
//  MyList
//
//  Created by Carlos Villanueva Ousset on 5/17/18.
//  Copyright © 2018 Carlos Villanueva Ousset. All rights reserved.
//

import Foundation

struct Movie: DataModel {

    let id: String
    let title: String
    let posterPath: String?
    let overview: String?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
        case overview
    }
}


