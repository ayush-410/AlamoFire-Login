//
//  DashboardViewController.swift
//  AlamoFireLoginSample
//
//  Created by Ayush Kumar Singh on 18/09/23.
//

import UIKit

class DashboardViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    
    var name = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        lblName.text = name
       
        // Do any additional setup after loading the view.
    }

    
    @IBAction func logoutTapped(_ sender: Any) {
        APIManager.shared.logOutApiCall { isSuccess in
            if isSuccess {
                debugPrint("Logout Successful")
                let rootVC = UIApplication.shared.windows.first?.rootViewController
                if rootVC?.children.first is DashboardViewController {
                    self.navigationController?.pushViewController(LoginViewController.sharedInstance(), animated: true)
                    
                } else {
                    self.navigationController?.popToRootViewController(animated: true)
                }
                
            } else {
                debugPrint("Logout Unsuccessful")
            }
        }
    }
}

extension DashboardViewController {
   static func sharedInstance() -> DashboardViewController {
        return DashboardViewController.instantiateFromStoryboard("Dashboard")
    }
}
