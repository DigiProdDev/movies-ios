//
//  MovieCell.swift
//  movies
//
//  Created by matheus.coutinho on 27/09/22.
//

import UIKit

protocol MovieCellDelegate: AnyObject {
    func didPressFavorite(status: Bool)
}

final class MovieCell: UICollectionViewCell {

    var isFavorite = false {
        didSet {
            setupButton()
        }
    }

    weak var delegate: MovieCellDelegate?

    private lazy var coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let favoriteButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    convenience init(frame: CGRect = .zero,
                     delegate: MovieCellDelegate? = nil,
                     image: UIImage? = nil,
                     title: String,
                     isFavorite: Bool) {
        self.init(frame: frame)

        configure(image: image, title: title, isFavorite: isFavorite)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func favoritePressed() {
        isFavorite.toggle()
        delegate?.didPressFavorite(status: isFavorite)
    }

    func configure(image: UIImage?, title: String, isFavorite: Bool) {
        if let image {
            self.coverImageView.image = image
        } else {
            if let placeholder = UIImage(named: "movie-placeholder") {
                self.coverImageView.image = placeholder
            }
        }
        self.isFavorite = isFavorite
        self.titleLabel.text = title
    }

    private func setupButton() {
        let image = isFavorite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        favoriteButton.setImage(image, for: .normal)
    }

}

// MARK: - ViewCodable

extension MovieCell: ViewCodable {

    func configure() {
        self.translatesAutoresizingMaskIntoConstraints = false
        setupButton()
        favoriteButton.addTarget(self, action: #selector(favoritePressed), for: .touchUpInside)
    }

    func buildHierarchy() {
        contentView.addSubview(coverImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(favoriteButton)
    }

    func buildConstraints() {
        NSLayoutConstraint.activate([
            coverImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            coverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            coverImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            coverImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.8),

            titleLabel.topAnchor.constraint(equalTo: coverImageView.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),

            favoriteButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            favoriteButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
        ])
    }

    func render() {
        backgroundColor = .init(red: 50 / 255,
                                green: 50 / 255,
                                blue: 200 / 255,
                                alpha: 1)
        titleLabel.textColor = .yellow
        favoriteButton.tintColor = .yellow
    }

}
