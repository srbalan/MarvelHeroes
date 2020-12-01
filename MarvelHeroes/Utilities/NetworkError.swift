//
//  NetworkError.swift
//  MarvelHeroes
//
//  Created by Lemi Developer on 12/1/20.
//

import Foundation

enum NetworkError: String, Error {
    case invalidEndpoint = "There's something wrong with your endpoint."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server is invalid. Please try again."
}
