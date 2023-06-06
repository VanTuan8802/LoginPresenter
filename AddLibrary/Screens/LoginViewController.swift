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
    @IBOutlet weak var btLogin: UIButton!
    @IBOutlet weak var txtPassword: UITextField!

    
    override func viewDidLoad() {
        //Khởi tạo instance của AuthAPIService
        let authAPIService = AuthAPIServiceImpl()
        
        //Khởi tạo instance của AuthRepository
        let authRespository = AuthRepositoryIml(authApiService: authAPIService)
        
            //Khởi tạo instance của LogonPresenter
        presenter = LoginPresenterImpl(controller: self, authRespository: authRespository)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func login(sender:UIButton)
    {
        let username = txtUser.text ?? ""
        let password = txtPassword.text ?? ""
        presenter.login(username: username, password: password)
    }

}

extension LoginViewController : LoginDisplay{
    func validateFailure(messing: String) {
        print("")
    }
}
