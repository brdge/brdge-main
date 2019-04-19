//
//  SettingsViewController.swift
//  Brdge
//
//  Created by Andre Campbell on 4/18/19.
//  Copyright © 2019 awBell. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var appleMusicButton: UIButton!
    @IBOutlet weak var tidalButton: UIButton!
    @IBOutlet weak var scButton: UIButton!
    @IBOutlet weak var spotifyButton: UIButton!
    var gsController: GlobalStateController?
    @IBOutlet weak var spotifyLabel: UILabel!
    @IBOutlet weak var scLabel: UILabel!
    @IBOutlet weak var tidalLabel: UILabel!
    @IBOutlet weak var amLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func spotifyDidTap(_ sender: Any) {
        if (gsController?.spotifyLoggedIn)! {
            gsController?.spotifyLoggedIn = false
            spotifyLabel.text = "Not Connected"
            spotifyLabel.backgroundColor = .white
            
        }
        else {
            performSegue(withIdentifier: "login", sender: sender)
            gsController?.spotifyLoggedIn = true
            spotifyLabel.text = "Connected"
            spotifyLabel.backgroundColor = .green
        }
        
    }
    
    @IBAction func appleMusicDidTap(_ sender: Any) {
        if (gsController?.appleMusicLoggedIn)! {
            amLabel.text = "Not Connected"
            amLabel.backgroundColor = .white
            gsController?.appleMusicLoggedIn = false
        }
        else {
            amLabel.text = "Connected"
            amLabel.backgroundColor = .green
            gsController?.appleMusicLoggedIn = true
        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        performSegue(withIdentifier: "login", sender: sender)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
        let vc = segue.destination as! LoginViewController
        

        
    }
        
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.

}
