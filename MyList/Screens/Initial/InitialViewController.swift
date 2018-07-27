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

    private var isInitialSetupNeeded = true

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        initialSetup()

        viewModel.showNextViewController()
            .subscribe()
            .disposed(by: disposeBag)
    }

    // MARK: Setup

    func bindViewModel() {}

    fileprivate func initialSetup() {
        guard isInitialSetupNeeded else { return }
        isInitialSetupNeeded = false

        let sceneCoordinator = SceneCoordinator(window: view.window!)
        self.viewModel = InitialViewModel(sceneCoordinator: sceneCoordinator)
    }
}

