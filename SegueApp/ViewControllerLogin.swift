//
//  ViewController.swift
//  SegueApp
//
//  Created by Muhammet on 11.08.2024.
//

import UIKit

class ViewControllerLogin: UIViewController {
    @IBOutlet weak var Handle: UILabel!
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var pass: UITextField!
    let (password,username)=("Pass123","Emin")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginB(_ sender: Any) {
        if pass.text?.elementsEqual(password) == true && user.text?.elementsEqual(username) == true{
            pass.text=""
            performSegue(withIdentifier: "toMainS", sender: nil)
        }else{
            Handle.text="Wrong Login"
            pass.text=""
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMainS"{
        
          let destination = segue.destination as! ViewControllerMain
            destination.myName=username
        }
    }
    
}

