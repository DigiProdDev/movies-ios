//
//  MovieListDataSource.swift
//  movies
//
//  Created by bruno.luebke.moreira on 26/09/22.
//

import UIKit

final class MovieListDataSource: NSObject, UICollectionViewDataSource {

    private var movies: [Movie] = .init()

    func update(with movies: [Movie]) {
        self.movies = movies
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Put cell here
    }

}
