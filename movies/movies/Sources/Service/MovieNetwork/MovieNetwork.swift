//
//  MovieNetwork.swift
//  movies
//
//  Created by Giuliano Accorsi on 20/10/22.
//

import Foundation

protocol MovieNetworkProtocol {
    func fetchMovies(onComplete: @escaping (Result<[Movie], ServiceError>) -> Void)
    func fetchGenres(onComplete: @escaping (Result<[Genre], ServiceError>) -> Void)
}

final class CryptoNetwork {

    private let getRequest: GetRequestable

    init(getRequest: GetRequestable) {
        self.getRequest = getRequest
    }

}

extension CryptoNetwork: MovieNetworkProtocol {

    func fetchMovies(onComplete: @escaping (Result<[Movie], ServiceError>) -> Void) {
        getRequest.get(urlString: "--AdicionarURL--", parser: [Movie].self, queryItems: [URLQueryItem(name: "api_key", value: "--AdicionarAPI--")]) { result in
            switch result {
            case .success(let movies):
                onComplete(.success(movies))
            case .failure(let serviceError):
                onComplete(.failure(serviceError))
            }
        }
    }

    func fetchGenres(onComplete: @escaping (Result<[Genre], ServiceError>) -> Void) {
        getRequest.get(urlString: "--AdicionarURL--", parser: [Genre].self, queryItems: [URLQueryItem(name: "api_key", value: "--AdicionarAPI--")]) { result in
            switch result {
            case .success(let genres):
                onComplete(.success(genres))
            case .failure(let serviceError):
                onComplete(.failure(serviceError))
            }
        }
    }

}
