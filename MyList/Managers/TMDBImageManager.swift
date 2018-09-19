//
//  ImageManager.swift
//  MyList
//
//  Created by Carlos Villanueva Ousset on 9/16/18.
//  Copyright © 2018 Carlos Villanueva Ousset. All rights reserved.
//

import UIKit
import SDWebImage

enum TMDBImageSize: String {
    case w500
}

class TMDBImageManager {
    static let shared = TMDBImageManager()

    fileprivate static func urlWithPath(_ path: String, size: TMDBImageSize) -> URL? {
        let urlStr = Config.TMDBApi.imageBaseURL + "/\(size.rawValue)" + path
        
        return URL(string: urlStr)
    }
}

extension UIImageView {
    func setTMDBImageWithPath(_ path: String?, size: TMDBImageSize = .w500, placeholder: UIImage? = nil) {
        guard let path = path else { return }

        sd_setImage(with: TMDBImageManager.urlWithPath(path, size: size), placeholderImage: placeholder)
    }
}


//"backdrop_sizes": [
//"w300",
//"w780",
//"w1280",
//"original"
//],
//"logo_sizes": [
//"w45",
//"w92",
//"w154",
//"w185",
//"w300",
//"w500",
//"original"
//],
//"poster_sizes": [
//"w92",
//"w154",
//"w185",
//"w342",
//"w500",
//"w780",
//"original"
//],
//"profile_sizes": [
//"w45",
//"w185",
//"h632",
//"original"
//],
//"still_sizes": [
//"w92",
//"w185",
//"w300",
//"original"
//]
