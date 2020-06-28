//
//  LoginViewController.swift
//  DogeChat
//
//  Created by Andy Lochan on 2/19/20.
//  Copyright © 2020 Andy Lochan. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func loginPressed(_ sender: UIButton) {
            
        if let email = emailTextField.text, let password = passwordTextField.text {
                Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                    if let e = error {

                        let alert = UIAlertController(title: "Alert", message: e.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        
                    } else {
                        //Navigate to the ChatViewController
                        self.performSegue(withIdentifier: K.loginSegue, sender: self)
                    }
                }
            }
        }
        
}
