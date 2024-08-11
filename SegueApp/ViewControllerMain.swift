//
//  2.swift
//  SegueApp
//
//  Created by Muhammet on 11.08.2024.
//

import UIKit

class ViewControllerMain: UIViewController {

    let userDefaults = UserDefaults.standard

     var myName = ""
    @IBOutlet weak var errorlabel: UILabel!
    @IBOutlet weak var bakiyeText: UILabel!
    @IBOutlet weak var addBakiye: UITextField!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var balance: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text=myName
        if var hisBalance = userDefaults.object(forKey: "balance"){
            if var balancetext = hisBalance as? NSNumber{
                balance.text = balancetext.stringValue
            }else{
                printError(text: "Wrong Value")
            }
        }else{
            userDefaults.set(0, forKey: "balance")
        }

    }
   
     @IBAction func addBalance(_ sender: Any) {
         
         if let oldBalance = Int(balance.text ?? "0"){
             if let addedBalance = Int(addBakiye.text ?? "0"){
                 let newbalance = oldBalance+addedBalance
                 balance.text = String(newbalance)
                 userDefaults.setValue(newbalance, forKey: "balance")
                 removeError()
             }else{
                 printError(text: "Wrong Value")
             }
         }else{
                 printError(text: "Wrong Value")
             }
    
         
     }
    
    @IBAction func removeBalance(_ sender: Any) {
        if let oldBalance = Int(balance.text ?? "0"){
            if let addedBalance = Int(addBakiye.text ?? "0"){
                let newbalance = oldBalance-addedBalance
                balance.text = String(newbalance)
                userDefaults.setValue(newbalance, forKey: "balance")
                removeError()
            }else{
                printError(text: "Wrong Value")
            }
        }else{
            printError(text: "Wrong Value")
        }
    }
    
    func printError(text :String){
        errorlabel.text = text
    }
    
    func removeError(){
        errorlabel.text=""
    }
    

    
}
