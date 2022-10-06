//
//  MovieListController.swift
//  movies
//
//  Created by bruno.luebke.moreira on 26/09/22.
//

import UIKit

final class MovieListViewController: UIViewController {

    private let rootView: MovieListView = MovieListView()

    private let dataSource: MovieListDataSource = MovieListDataSource()
    private let delegate: MovieListDelegate = MovieListDelegate()

    override func loadView() {
        <#code#>
    }

    override func viewDidLoad() {
        rootView.movieCollection.dataSource = dataSource
        rootView.movieCollection.delegate = delegate
    }

    override func viewWillAppear(_ animated: Bool) {
        // Call the data
    }

}
