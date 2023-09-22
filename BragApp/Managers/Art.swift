//
//  Art.swift
//  BragApp
//
//  Created by Alivia Fairchild on 9/21/23.
//

import Foundation

struct ArtResponse: Codable {
    var data: [Art]
}

struct Art: Codable {
//    var objectID: Int
//    var primaryImage: String?
//    var constituents: [Constituent]
    var departments: [Department]
//    var title: String
//    var objectEndDate: Int
}

struct Department: Codable {
    var displayName: String
}
