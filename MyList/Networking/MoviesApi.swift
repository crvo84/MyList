//
//  MoviesApi.swift
//  MyList
//
//  Created by Carlos Villanueva Ousset on 5/18/18.
//  Copyright © 2018 Carlos Villanueva Ousset. All rights reserved.
//

import Foundation
import Moya

enum MoviesApi {
    case popular(page: Int)
}

extension MoviesApi: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.themoviedb.org/3/movie")!
    }

    var path: String {
        switch self {
        case .popular:
            return "/popular"
        }
    }

    var method: Moya.Method {
        switch self {
        case .popular:
            return .get
        }
    }

    var sampleData: Data {
        return Data() // TODO: implement for tests
    }

    var task: Task {
        switch self {
        case let .popular(page):
            return .requestParameters(parameters: popularRequestParameters(page: page),
                                      encoding: URLEncoding.queryString)
        }
    }

    var headers: [String : String]? {
        switch self {
        case .popular:
            return nil
        }
    }

    // MARK: Helper methods

    private func popularRequestParameters(page: Int) -> [String: Any] {
        return [
            "api_key": Secrets.TMDBApi.key,
            "page": page,
            "language": "en-US"
        ]
    }
}
