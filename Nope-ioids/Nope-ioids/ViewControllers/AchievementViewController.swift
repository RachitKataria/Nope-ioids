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
        achievementsLabel.font = UIFont.systemFont(ofSize: 32, weight: UIFont.Weight.ultraLight)
    }

    @IBAction func backButtonPressed(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ProgressStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ProgressViewController") as! ProgressViewController
        self.show(vc, sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
