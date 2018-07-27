//
//  PopularMoviesViewModel.swift
//  MyList
//
//  Created by Carlos Villanueva Ousset on 5/18/18.
//  Copyright © 2018 Carlos Villanueva Ousset. All rights reserved.
//

import Foundation
import RxSwift
import Action

protocol PopularMoviesViewModelType {
    var movies: BehaviorSubject<[Movie]> { get }
}

class PopularMoviesViewModel: PopularMoviesViewModelType {

    private let sceneCoordinator: SceneCoordinatorType
    private let moviesService: MoviesServiceType
    private let disposeBag = DisposeBag()
    let movies = BehaviorSubject<[Movie]>(value: [])

    init(sceneCoordinator: SceneCoordinatorType, moviesService: MoviesServiceType = MoviesService()) {
        self.sceneCoordinator = sceneCoordinator
        self.moviesService = moviesService
    }

    func loadMovies() -> Completable {
        return moviesService.popularMovies(page: 1)
                .asObservable()
                .do(onNext: { [weak self] movies in
                    self?.movies.onNext(movies)
                })
                .ignoreElements()
    }

}
