//
//  LoginViewController.swift
//  Brdge
//
//  Created by Andre Campbell on 4/18/19.
//  Copyright © 2019 awBell. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {


    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTap(_ sender: Any) {
        if (passwordTextField.text == "chicken") {
            self.dismiss(animated: true, completion: nil)
        }
    }
    @IBAction func didTapCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
