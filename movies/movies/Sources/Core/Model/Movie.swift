//
//  Movie.swift
//  movies
//
//  Created by gustavo.garcia.leite on 26/09/22.
//

import Foundation

struct MovieResponse: Decodable {
    
    let page: Int?
    let results: [Movie]
    let totalResults: Int?
    let totalPages: Int?

    private enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}

struct Movie: Decodable {
    
    let id: Int?
    let genreIds: [Int]?
    let overview: String?
    let originalTitle: String?
    let posterPath: String?
    let releaseDate: Date?
    let title: String?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case genreIds = "genre_ids"
        case overview
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
    }
}
