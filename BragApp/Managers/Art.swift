//
//  Art.swift
//  BragApp
//
//  Created by Alivia Fairchild on 9/21/23.
//

import Foundation

// future proofing - use the request for ObjectIDs and then insert that into a function for the ObjectID detail request. Currently working off the assumption that the response are simple Ints that we can generate on our own and cycle through will not change for sake of time.

struct Art: Codable, Hashable {
    var objectID: Int
    var isPublicDomain: Bool
    var primaryImage: String?
    var artistDisplayName: String?
    var department: String?
    var title: String?
    var objectEndDate: Int?
}
