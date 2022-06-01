//
//  SecondViewController.swift
//  SignIn
//
//  Created by aiv on 01.06.2022.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var welcomeUser: UILabel!
    
    var text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeUser.text = text
    }

}
