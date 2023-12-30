//
//  LoginViewController.swift
//  AlamoFireLoginSample
//
//  Created by Ayush Kumar Singh on 17/09/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginTapped(_ sender: Any) {
        guard let email = emailTxt.text else {
            return
        }
        guard let password = passwordTxt.text else {
            return
        }
        let userLoginModel = loginRequestModel(login: email, password: password)
        APIManager.shared.loginApiCall(loginRequestModel: userLoginModel) { response in
            switch response {
            case .success(let json):
                debugPrint(json)
                let dashBoardVC = DashboardViewController.sharedInstance()
                dashBoardVC.name = (json as! loginResponseModel).name
                TokenService.shared.saveName(name: dashBoardVC.name)
                self.navigationController?.pushViewController(dashBoardVC, animated: true)
                
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    
    @IBAction func signUpTapped(_ sender: Any) {
        let signUpVC = SignUpViewController.sharedInstance()
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }

}

extension LoginViewController {
   static func sharedInstance() -> LoginViewController {
        return LoginViewController.instantiateFromStoryboard("Login")
    }
}

