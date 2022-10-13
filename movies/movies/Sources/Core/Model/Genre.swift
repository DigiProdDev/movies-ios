//
//  Genre.swift
//  movies
//
//  Created by gustavo.garcia.leite on 26/09/22.
//

struct GenreResponse: Decodable {
    let genres: [Genre]
}

struct Genre: Decodable {
    let id: Int?
    let name: String?
}
