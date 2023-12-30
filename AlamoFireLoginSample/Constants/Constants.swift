//
//  Constants.swift
//  AlamoFireLoginSample
//
//  Created by Ayush Kumar Singh on 16/09/23.
//

import Foundation

struct Constant {
    
    static let app_id = "7FD8DB38-2784-D422-FF18-1378EDA15700"
    static let rest_api_key = "99F9AEA5-7FC0-4E15-9B83-12E1E0BCB2DE"
    static let base_url = "https://api.backendless.com/\(app_id)/\(rest_api_key)/users/"
    static let register_url = "\(base_url)register"
    static let login_url = "\(base_url)login"
    static let logout_url = "\(base_url)logout"
}

enum APIErrors: Error {
case custom(message: String)
}

struct TokenKey {
    static let key = "USER_TOKEN_KEY"
    static let nameKey = "USER_NAME_KEY"
}
