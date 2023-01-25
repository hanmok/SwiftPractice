//
//  GFError.swift
//  ResultType
//
//  Created by Mac mini on 2023/01/25.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "some error"
    case unableToComplete = "unable to complete"
    case invalidResponse = "invalid Response"
    case invalidData = "invalid data"
}
