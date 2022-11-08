//
//  GetRequestable.swift
//  movies
//
//  Created by Giuliano Accorsi on 08/11/22.
//

import Foundation

protocol GetRequestable {
    func get<T: Decodable> (urlString: String,
                            parser: T.Type,
                            queryItems: [URLQueryItem]?,
                            onComplete: @escaping (Result<T, ServiceError>) -> Void)
}
