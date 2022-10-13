//
//  Error.swift
//  movies
//
//  Created by gustavo.garcia.leite on 26/09/22.
//

struct Error {
    
    let statusMessage: String?
    let statusCode: Int?
    
    enum CodingKeys: String, CodingKey {
        case statusMessage = "status_message"
        case statusCode = "status_code"
    }
}
