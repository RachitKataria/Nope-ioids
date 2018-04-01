//
//  TimeCapsuleEntryViewController.swift
//  Nope-ioids
//
//  Created by Rachit Kataria on 3/31/18.
//  Copyright © 2018 Rachit Kataria. All rights reserved.
//

import UIKit

class TimeCapsuleEntryViewController: UIViewController {
    var entryIndex: Int!
    @IBOutlet weak var whatInput: UITextField!
    @IBOutlet weak var whenInput: UITextField!
    
    @IBOutlet weak var whyInput: UITextView!
    @IBOutlet weak var whereInput: UITextField!
    @IBOutlet weak var whoInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let entry = TimeCapsuleEntriesModel.sharedInstance.entries[entryIndex]
        
        whoInput.text = entry.whoInput
        whatInput.text = entry.whatInput
        whenInput.text = entry.whenInput
        whereInput.text = entry.whereInput
        whyInput.text = entry.whyInput
        
        whoInput.isUserInteractionEnabled = false
        whatInput.isUserInteractionEnabled = false
        whenInput.isUserInteractionEnabled = false
        whereInput.isUserInteractionEnabled = false
        whyInput.isUserInteractionEnabled = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
