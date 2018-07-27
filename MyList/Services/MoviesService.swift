//
//  MoviesService.swift
//  MyList
//
//  Created by Carlos Villanueva Ousset on 5/18/18.
//  Copyright © 2018 Carlos Villanueva Ousset. All rights reserved.
//

import Foundation
import RxSwift
import Moya

protocol MoviesServiceType {
    func popularMovies(page: Int) -> Observable<[Movie]>
}

struct MoviesService: MoviesServiceType {

    private let provider: MoyaProvider<MoviesApi>

    init(provider: MoyaProvider<MoviesApi> = MoviesService.getDefaultProvider()) {
        self.provider = provider
    }

    func popularMovies(page: Int) -> Observable<[Movie]> {
        return self.provider.rx.request(.popular(page: page))
            .map([Movie].self, atKeyPath: "results")
            .asObservable()
    }

    // MARK: - Helper methods

    private static func getDefaultProvider() -> MoyaProvider<MoviesApi> {
        return MoyaProvider<MoviesApi>(plugins: [NetworkLoggerPlugin(verbose: true)])
    }
}
