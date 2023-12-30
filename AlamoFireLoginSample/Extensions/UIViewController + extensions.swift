//
//  ViewController + extensions.swift
//  AlamoFireLoginSample
//
//  Created by Ayush Kumar Singh on 18/09/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    class func instantiateFromStoryboard(_ name: String) -> Self {
        return instantiateFromStoryboardHelper(name)
    }
    
    class func instantiateFromStoryboardHelper<T>(_ name: String) -> T {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "\(Self.self)") as! T
        return controller
    }
    
    func showAlert(title: String,message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
}
