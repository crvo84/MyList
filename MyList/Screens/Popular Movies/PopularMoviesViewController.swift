//
//  PopularMoviesViewController.swift
//  MyList
//
//  Created by Carlos Villanueva Ousset on 5/18/18.
//  Copyright © 2018 Carlos Villanueva Ousset. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class PopularMoviesViewController: UIViewController, BindableType {

    fileprivate struct CellReuseId {
        static let movie = "MovieCell"
    }

    fileprivate struct Geometry {
        static let movieRowHeight: CGFloat = 60
    }

    @IBOutlet fileprivate weak var tableView: UITableView!

    var viewModel: PopularMoviesViewModel!
    fileprivate let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetup()

        viewModel.loadMovies()
            .subscribe()
            .disposed(by: disposeBag)
    }

    fileprivate func initialSetup() {
        let movieCellNib = UINib(nibName: "MovieTableViewCell", bundle: nil)
        tableView.register(movieCellNib, forCellReuseIdentifier: CellReuseId.movie)
        tableView.rowHeight = Geometry.movieRowHeight
    }

    func bindViewModel() {
        viewModel.movies
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: CellReuseId.movie, cellType: MovieTableViewCell.self)) { row, movie, cell in
                cell.configure(with: movie)
            }
            .disposed(by: disposeBag)
    }
}














