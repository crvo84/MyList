//
//  InitialViewController.swift
//  MyList
//
//  Created by Carlos Villanueva Ousset on 7/12/18.
//  Copyright © 2018 Carlos Villanueva Ousset. All rights reserved.
//

import Foundation
import RxSwift

class InitialViewController: MyTimeViewController, BindableType {

    var viewModel: InitialViewModel!

    private var needInitialSetup = true

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        initialSetup()

        viewModel.presentLoginViewController()
            .subscribe()
            .disposed(by: disposeBag)
    }

    fileprivate func initialSetup() {
        guard needInitialSetup else { return }
        needInitialSetup = false

        navigationController?.isNavigationBarHidden = true

        let sceneCoordinator = SceneCoordinator(window: view.window!)
        self.viewModel = InitialViewModel(sceneCoordinator: sceneCoordinator)
    }

    func bindViewModel() {}
}

