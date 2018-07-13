//
//  InitialViewModel.swift
//  MyList
//
//  Created by Carlos Villanueva Ousset on 7/12/18.
//  Copyright © 2018 Carlos Villanueva Ousset. All rights reserved.
//

import Foundation
import RxSwift

protocol InitialViewModelType {
    var sceneCoordinator: SceneCoordinatorType { get }
    func presentLoginViewController() -> Completable
}

struct InitialViewModel {
    let sceneCoordinator: SceneCoordinatorType

    func presentPopularMoviesViewController() -> Completable {
        let popularMoviesViewModel = PopularMoviesViewModel(sceneCoordinator: sceneCoordinator)
        return sceneCoordinator.transition(to: Scene.popularMovies(popularMoviesViewModel), type: .root)
    }
}

