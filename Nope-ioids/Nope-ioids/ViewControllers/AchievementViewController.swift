//
//  AchievementViewController.swift
//  Nope-ioids
//
//  Created by Kelly Lampotang on 3/31/18.
//  Copyright © 2018 Rachit Kataria. All rights reserved.
//

import UIKit

class AchievementViewController: UIViewController {

    @IBOutlet weak var achievementsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        achievementsLabel.font = UIFont(name: ".SFUIText-Medium", size: 18)!
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
