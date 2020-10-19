//
//  LoginViewController.swift
//  Instagrame
//
//  Created by William Daugherty on 10/18/20.
//  Copyright © 2020 William Daugherty. All rights reserved.
//

import UIKit
import Parse
class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let user = PFUser()
          user.username = usernameField.text!
          user.password = passwordField.text!
        PFUser.logInWithUsername(inBackground: user.username!, password: user.password!) {
            (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        
          let user = PFUser()
            user.username = usernameField.text
            user.password = passwordField.text
        user.signUpInBackground{ (success, error) in
            if error != nil {
                print("Error: \(String(describing: error?.localizedDescription))")
            } else {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
