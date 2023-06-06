//
//  AuthAPIService.swift
//  AddLibrary
//
//  Created by Nguyễn Tuấn on 05/06/2023.
//

import Foundation
import Alamofire

protocol AuthAPIService{
    func login(username: String,
               password: String,
               sucsess:((LoginEntity)->Void)?,
               failure:((String?)->Void)?)
    
}

class AuthAPIServiceImpl:AuthAPIService{
    func login(username: String, password: String,
               sucsess: ((LoginEntity) -> Void)?,
               failure: ((String?) -> Void)?) {
        AF.request("https://learn-api-3t7z.onrender.com/login",
                   method: .post,
                   parameters: [
                    "username":username,
                    "password":password
                   ],
                   encoder: JSONParameterEncoder.default)
        .validate(statusCode: 200..<300)
        .responseDecodable(of: LoginEntity.self) { response in
            switch response.result{
            case .success(let entity):
                ///Case API success
                sucsess?(entity)
            case .failure(let error):
                ///Case API failure
                failure?(error.failureReason)
            }
        }
    }
}
