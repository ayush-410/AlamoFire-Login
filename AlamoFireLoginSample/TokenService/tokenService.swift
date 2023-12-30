//
//  tokenService.swift
//  AlamoFireLoginSample
//
//  Created by Ayush Kumar Singh on 18/09/23.
//

import UIKit

class TokenService {
    
    let userDefaults = UserDefaults.standard
    static let shared = TokenService()
    private init(){}
    
    func saveToken(token: String) {
        userDefaults.set(token, forKey: TokenKey.key)
    }
    
    func getToken() -> String {
        guard let token = userDefaults.value(forKey: TokenKey.key) as? String else {
            return ""
        }
        return token
    }
    
    func isUserLoggedIn() -> Bool {
        return getToken() != "" ? true : false
    }
    
    func removeToken() {
        userDefaults.removeObject(forKey: TokenKey.key)
    }
    
    func saveName(name: String) {
        userDefaults.set(name, forKey: TokenKey.nameKey)
    }
    func getName() -> String {
        guard let name = userDefaults.value(forKey: TokenKey.nameKey) as? String else {
            return ""
        }
        return name
    }
    
}


