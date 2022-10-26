//
//  ErrorModel.swift
//  movies
//
//  Created by matheus.coutinho on 26/10/22.
//

import Foundation

enum ErrorType {
    case generic
    case emptySearch
}

struct ErrorModel {

    let message: String
    let errorType: ErrorType

}
