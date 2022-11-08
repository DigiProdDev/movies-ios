//
//  GetRequest.swift
//  movies
//
//  Created by Giuliano Accorsi on 20/10/22.
//

import Foundation

final class GetRequest: GetRequestable {

    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func get<T>(urlString: String,
                parser: T.Type,
                queryItems: [URLQueryItem]?,
                onComplete: @escaping (Result<T, ServiceError>) -> Void) where T: Decodable {

        var url = URLComponents(string: urlString)

        if let queryItems {
            url?.queryItems = queryItems
        }

        guard let url = url?.url else {
            return onComplete(.failure(.badURL))
        }

        session.dataTask(with: url) { data, response, error in
            if error != nil {
                return onComplete(.failure(.taskError))
            }

            guard let response = response as? HTTPURLResponse else {
                return onComplete(.failure(.noResponse))
            }

            if !(200...299 ~= response.statusCode) {
                return onComplete(.failure(.invalidStatusCode(response.statusCode)))
            }

            guard let data = data else {
                return onComplete(.failure(.noData))
            }

            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                onComplete(.success(result))
            } catch {
                return onComplete(.failure(.decodingError))
            }
        }
        .resume()
    }

}
