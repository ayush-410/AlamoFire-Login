//
//  APIManager.swift
//  AlamoFireLoginSample
//
//  Created by Ayush Kumar Singh on 16/09/23.
//

import Foundation
import Alamofire

class APIManager {
    
    static let shared = APIManager()
    private init(){}
    
    typealias Handler = (Result<Any, APIErrors>) -> Void
    
    func signupApiCall(userModel: registerRequestModel, completionHandler: @escaping (Bool,String) -> ()) {
        
        let header: HTTPHeaders = [.contentType("application/json")]
        
        AF.request(Constant.register_url, method: .post, parameters: userModel, encoder: JSONParameterEncoder.default, headers: header).response { response in
            debugPrint(response)
            switch response.result {
            case .success(let data):
                do {
                    let json = try JSONSerialization.jsonObject(with: data!)
                    debugPrint(json)
                    if response.response?.statusCode == 200 {
                        completionHandler(true, "User Registered Succesfully")
                    } else {
                        completionHandler(false,"Please Try Again")
                    }
                } catch {
                    debugPrint(error.localizedDescription)
                    completionHandler(false,"Please Try Again")
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
                completionHandler(false,"Please Try Again")
            }
        }
    }
    
    func loginApiCall(loginRequestModel: loginRequestModel, completionHandler: @escaping Handler) {
        
        let header: HTTPHeaders = [.contentType("application/json")]
        
        AF.request(Constant.login_url, method: .post, parameters: loginRequestModel, encoder: JSONParameterEncoder.default, headers: header).response { response in
            debugPrint(response)
            switch response.result {
            case .success(let data):
                do {
//                    let json = try JSONSerialization.jsonObject(with: data!)
//                    debugPrint(json)
                    let json = try JSONDecoder().decode(loginResponseModel.self, from: data!)
                    
                    if response.response?.statusCode == 200 {
                        TokenService.shared.saveToken(token: json.userToken)
                        completionHandler(.success(json))
                    } else {
                        completionHandler(.failure(.custom(message: "Please check your network connectivity")))
                    }
                } catch {
                    debugPrint(error.localizedDescription)
                    completionHandler(.failure(.custom(message: "Please try again")))
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
                completionHandler(.failure(.custom(message: "Please try again")))
            }
        }
    }
    
    func logOutApiCall(completionHandler: @escaping (Bool) -> Void) {
        
        let header : HTTPHeaders = ["user-token": "\(TokenService.shared.getToken())"]
        
        AF.request(Constant.logout_url, method: .get, headers: header).response { response in
            switch response.result {
            case .success(_):
                TokenService.shared.removeToken()
                completionHandler(true)
                
            case .failure(let error):
                debugPrint(error.localizedDescription)
                completionHandler(false)
            }
        }
        
    }
}
