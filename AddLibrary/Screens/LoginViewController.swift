//
//  LoginViewController.swift
//  AddLibrary
//
//  Created by Nguyễn Tuấn on 05/06/2023.
//

import UIKit

protocol LoginDisplay{
    func validateFailure(messing: String)
}

class LoginViewController: UIViewController {

    var presenter: LoginPresenter!
    
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var lableUsername: UILabel!
    @IBOutlet weak var btLogin: UIButton!
    @IBOutlet weak var lablePassword: UILabel!
    @IBOutlet weak var txtPassword: UITextField!

    
    override func viewDidLoad() {
        //Khởi tạo instance của AuthAPIService
        let authAPIService = AuthAPIServiceImpl()
        
        //Khởi tạo instance của AuthRepository
        let authRespository = AuthRepositoryIml(authApiService: authAPIService)
        
            //Khởi tạo instance của LogonPresenter
        presenter = LoginPresenterImpl(controller: self, authRespository: authRespository)
        super.viewDidLoad()
    }
    


    @IBAction func login(sender:UIButton)
    {
        let username = txtUser.text ?? ""
        if(username == "")
        {
            lableUsername.text = "username is required"
        }
        
        let password = txtPassword.text ?? ""
        if(password == "")
        {
            lablePassword.text = "password is required"
        }
        presenter.login(username: username, password: password)
    }

}

extension LoginViewController{
    
}

extension LoginViewController : LoginDisplay{
    func validateFailure(messing: String) {
        print("gggg")
    }
}
