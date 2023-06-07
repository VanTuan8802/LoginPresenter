//
//  TetsLoginPresenter.swift
//  AddLibraryTests
//
//  Created by Nguyễn Tuấn on 05/06/2023.
//

import Foundation
import Quick
import Nimble
import Mockingbird

@testable import AddLibrary

class TestLoginPrenter:QuickSpec {
    override class func spec() {
        describe("Login"){
            /**
             Bước 1.  Tạo instance của LoginPresenter
             */
            var sut:LoginPresenter!
            
            var loginDisplayMock:LoginDisplayMock!
            
            var authRespository:AuthRepository!

            /**Sẽ chạy trước test case*/
            
            beforeEach {
                loginDisplayMock = mock(LoginDisplay.self)
                sut = LoginPresenterImpl(controller: loginDisplayMock, authRespository:authRespository )
            }
            
            /**
             Group lại các test case
             **/
            context("Login form validate"){
                it("check username empty")
                {
                    /**
                     input : username rỗng
                     action. : .login(username,password)
                     
                    */
                    
                    //input
                    let username = ""
                    
                    //action
                    sut.login(username: username, password: "Test")
                    
                    ///expect
                    verify(loginDisplayMock.validateFailure(messing: "User is required")).wasCalled()
                }
            }
        }
    }
}
