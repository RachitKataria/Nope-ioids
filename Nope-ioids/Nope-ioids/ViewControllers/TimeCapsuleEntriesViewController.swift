//
//  TimeCapsuleEntriesViewController.swift
//  Nope-ioids
//
//  Created by Rachit Kataria on 3/31/18.
//  Copyright © 2018 Rachit Kataria. All rights reserved.
//

import UIKit

class TimeCapsuleEntriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var entryTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TimeCapsuleEntriesModel.sharedInstance.entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell", for: indexPath)
        cell.textLabel?.text = "Entry #" + String(indexPath.row + 1)
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViewEntrySegue", let destination = segue.destination as? TimeCapsuleEntryViewController {
            if let cell = sender as? UITableViewCell, let indexPath = entryTableView.indexPath(for: cell) {
                destination.entryIndex = indexPath.row
            }
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

}
