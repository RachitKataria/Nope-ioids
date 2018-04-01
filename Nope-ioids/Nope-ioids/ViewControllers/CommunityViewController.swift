//
//  CommunityViewController.swift
//  Nope-ioids
//
//  Created by Kelly Lampotang on 4/1/18.
//  Copyright © 2018 Rachit Kataria. All rights reserved.
//

import UIKit

class CommunityViewController: UIViewController {

    var index = 0
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var shuffleButton: UIButton!
    @IBOutlet weak var quoteLabel: UILabel!
    let data = ["You got this! I'm over 15 months sober! Really starting to see the gifts of sobriety. It's amazing what happens when we learn to water our spiritual gardens and see the seeds begin to blossom. ", "Stay strong! You just have to take it one day at a time, keep it simple and we will all trudge along together. Life is a journey with bumps and stops but has a destination of hope!", "Look into yourself and find inspiration. When you start looking at people's hearts instead of their faces, life becomes clear.", "You can overcome this. You do not have to cover up being an addict in recovery for anyone. Ever. Wear your courage proudly for what you have overcome. Clean and sober is just plain badass."]
    let names = ["-Ying, Westwood, Los Angeles", "-Chelsea, Los Angeles, CA", "-Mark, Playa Vista, CA", "-Eduardo, Downtown Los Angeles, CA"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func shufflePressed(_ sender: Any) {
        index = (index + 1)%4
        quoteLabel.text = data[index]
        nameLabel.text = names[index]
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "HelpStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HelpViewController") as! HelpViewController
        self.show(vc, sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
