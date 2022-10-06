//
//  MovieListView.swift
//  movies
//
//  Created by bruno.luebke.moreira on 26/09/22.
//

import UIKit

final class MovieListView: UIView {

    public lazy var movieCollection: UICollectionView = {
        let collection: UICollectionView = UICollectionView(frame: .zero)
        collection.backgroundColor = .clear

        return collection
    }()

    
}
