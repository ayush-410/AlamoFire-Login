//
//  ViewController.swift
//  AlamoFireLoginSample
//
//  Created by Ayush Kumar Singh on 16/09/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var fname: UITextField!
    @IBOutlet weak var lname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signUpTapped(_ sender: Any) {
        guard let fname = fname.text else {
            return
        }
        guard let lname = lname.text else {
            return
        }
        guard let email = email.text else {
            return
        }
        guard let password = password.text else {
            return
        }
        let userModel = registerRequestModel(name: fname + lname, email: email, password: password)
        APIManager.shared.signupApiCall(userModel: userModel) { isSuccess, message in
            if isSuccess {
                self.showAlert(title: "Alert", message: message)
            } else {
                self.showAlert(title: "Alert", message: message)
            }
        }
    }
    
}

extension SignUpViewController {
    static func sharedInstance() -> SignUpViewController {
         return SignUpViewController.instantiateFromStoryboard("SignUp")
     }
}
