//
//  loginResponseModel.swift
//  AlamoFireLoginSample
//
//  Created by Ayush Kumar Singh on 17/09/23.
//

import Foundation

struct loginResponseModel: Decodable {
    let lastLogin: Int
    let userStatus: String
    let created: Int
    let accountType, ownerID, socialAccount: String
    let name, welcomeClass, blUserLocale, userToken: String
    let objectID, email: String

    enum CodingKeys: String, CodingKey {
        case lastLogin, userStatus, created, accountType
        case ownerID = "ownerId"
        case socialAccount, name
        case welcomeClass = "___class"
        case blUserLocale
        case userToken = "user-token"
        case objectID = "objectId"
        case email
    }
}
