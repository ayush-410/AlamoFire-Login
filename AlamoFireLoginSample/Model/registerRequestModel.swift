//
//  RequestModel.swift
//  AlamoFireLoginSample
//
//  Created by Ayush Kumar Singh on 16/09/23.
//

import Foundation

struct registerRequestModel: Encodable {
    let name: String
    let email: String
    let password: String
}
