//
//  ViewCodable.swift
//  movies
//
//  Created by Gustavo Garcia Leite on 30/06/22.
//

protocol ViewCodable {
    func setupView()
    func configure()
    func buildHierarchy()
    func buildConstraints()
    func render()
}

extension ViewCodable {

    func setupView() {
        configure()
        buildHierarchy()
        buildConstraints()
        render()
    }

}
