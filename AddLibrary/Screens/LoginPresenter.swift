//
//  LoginPresenter.swift
//  AddLibrary
//
//  Created by Nguyễn Tuấn on 05/06/2023.
//

import Foundation

protocol LoginPresenter{
    func login(username:String,password:String)
}

class LoginPresenterImpl : LoginPresenter{
    var controller : LoginDisplay
    var authRespository : AuthRepository
    
    init(controller: LoginDisplay, authRespository: AuthRepository) {
        self.controller = controller
        self.authRespository = authRespository
    }
    
    //    func validateForm() ->Bool{
    //
    //        return false
    //    }
    
    
    func login(username: String,password : String)
    {
        if(username.isEmpty){
            controller.validateFailure(messing: "User is required")
        }
        else{
            //Show loading
            authRespository.login(username: username, password: password){
                response in
                ///
                ///Tắt loading
                ///Kiểm tra xem trong response đã có data chưa
                ///
                
            }
        failure:{errMsg in
            ///Tắt loading
            ///Trả về message lỗi cho ViewController
        }
        }
    }
    
}
