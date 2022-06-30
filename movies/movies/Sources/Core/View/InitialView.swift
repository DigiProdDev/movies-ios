//
//  InitialView.swift
//  movies
//
//  Created by Gustavo Garcia Leite on 30/06/22.
//

import UIKit

final class InitialView: UIView {
    
    private(set) var titleLabel: UILabel
    
    override init(frame: CGRect = .zero) {
        titleLabel = UILabel()
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
    }
    
    func buildConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func render() {
        backgroundColor = .yellow
        titleLabel.backgroundColor = .black
        titleLabel.textColor = .white
    }
}

