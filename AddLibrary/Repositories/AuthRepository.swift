//
//  AuthRepositỏy.swift
//  AddLibrary
//
//  Created by Nguyễn Tuấn on 05/06/2023.
//

import Foundation

protocol AuthRepository{
    func login(username: String,
               password: String,
               sucsess:((LoginEntity)->Void)?,
               failure:((String?)->Void)?)
    
}

class AuthRepositoryIml:AuthRepository{
    var authApiService:AuthAPIService
    
    init(authApiService: AuthAPIService) {
        self.authApiService = authApiService
    }
    func login(username: String,
               password: String,
               sucsess:((LoginEntity)->Void)?,
               failure:((String?)->Void)?){
        authApiService.login(username: username, password: password, sucsess: sucsess, failure: failure)
        
    }
}
