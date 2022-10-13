//
//  InitialView.swift
//  movies
//
//  Created by Gustavo Garcia Leite on 30/06/22.
//

import UIKit

final class InitialView: UIView {
    
    private(set) var titleLabel: UILabel
    
    private(set) var movieCell: MovieCell
    
    override init(frame: CGRect = .zero) {
        titleLabel = UILabel()
        movieCell = MovieCell(delegate: nil,
                              image: .init(named: "movie-placeholder")!,
                              title: "Thor", isFavorite: false)
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension InitialView: ViewCodable {
    
    func configure() {
        titleLabel.text = "Movies"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    func buildHierarchy() {
        addSubview(titleLabel)
        addSubview(movieCell)
    }
    
    func buildConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            movieCell.centerXAnchor.constraint(equalTo: centerXAnchor),
            movieCell.centerYAnchor.constraint(equalTo: centerYAnchor),
            movieCell.heightAnchor.constraint(equalToConstant: 250),
            movieCell.widthAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    func render() {
        backgroundColor = .yellow
        titleLabel.backgroundColor = .black
        titleLabel.textColor = .white
    }
}

