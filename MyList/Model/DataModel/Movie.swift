//
//  Movie.swift
//  MyList
//
//  Created by Carlos Villanueva Ousset on 5/17/18.
//  Copyright © 2018 Carlos Villanueva Ousset. All rights reserved.
//

import Foundation

struct Movie: DataModel {

    let id: Int
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

extension Movie {
    var posterUrl: URL? {
        guard let posterPath = posterPath else { return nil }

        let urlStr = Config.TMDBApi.baseURL + "/\(id)/images" + posterPath
        return URL(string: urlStr)
    }
}


