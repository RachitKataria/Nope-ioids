//
//  TimeCapsuleViewController.swift
//  Nope-ioids
//
//  Created by Rachit Kataria on 3/31/18.
//  Copyright © 2018 Rachit Kataria. All rights reserved.
//

import UIKit

class TimeCapsuleViewController: UIViewController {
    
    @IBOutlet weak var whoInput: UITextField!
    @IBOutlet weak var whatInput: UITextField!
    @IBOutlet weak var whenInput: UITextField!
    @IBOutlet weak var whereInput: UITextField!
    @IBOutlet weak var whyInput: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        self.view.addGestureRecognizer(tapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        if(whoInput.isFirstResponder) {
            whoInput.resignFirstResponder()
        } else if(whatInput.isFirstResponder) {
            whatInput.resignFirstResponder()
        } else if(whenInput.isFirstResponder) {
            whenInput.resignFirstResponder()
        } else if(whereInput.isFirstResponder) {
            whereInput.resignFirstResponder()
        } else if(whyInput.isFirstResponder) {
            whyInput.resignFirstResponder()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func didPressSubmit(_ sender: Any) {
        let newEntry = TimeCapsuleEntry.init(whoVal: whoInput.text!, whatVal: whatInput.text!, whereVal: whereInput.text!, whenVal: whenInput.text!, whyVal: whyInput.text!)
        print(newEntry)
        
        TimeCapsuleEntriesModel.sharedInstance.entries.append(newEntry)
    }
    
}
