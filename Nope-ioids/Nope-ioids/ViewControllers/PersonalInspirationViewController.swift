//
//  PersonalInspirationViewController.swift
//  Nope-ioids
//
//  Created by Kelly Lampotang on 4/1/18.
//  Copyright © 2018 Rachit Kataria. All rights reserved.
//

import UIKit

class PersonalInspirationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "HelpStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HelpViewController") as! HelpViewController
        self.show(vc, sender: self)
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
