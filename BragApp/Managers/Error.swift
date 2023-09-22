//
//  Error.swift
//  BragApp
//
//  Created by Alivia Fairchild on 9/22/23.
//

import Foundation

enum ErrorMessage: String, Error {
    case invalidURL = "There was an issue connecting to the server."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidData = "The data received from the server was invalid. Please try again."
}
