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

struct PopularMoviesViewModel {
    let sceneCoordinator: SceneCoordinatorType
    let disposeBag = DisposeBag()

    init(sceneCoordinator: SceneCoordinatorType) {
        self.sceneCoordinator = sceneCoordinator
    }
}
