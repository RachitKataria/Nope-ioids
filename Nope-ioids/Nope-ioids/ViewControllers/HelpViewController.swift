import UIKit

class HelpViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func callFriendPressed(_ sender: Any) {
        let alertController = UIAlertController(title: nil, message: "Choose a friend to call", preferredStyle: .actionSheet)
        
        let friend1Action = UIAlertAction(title: "Call Mom", style: .default) { action in
            // ...
        }
        alertController.addAction(friend1Action)
        
        let friend2Action = UIAlertAction(title: "Call Stacey", style: .default) { action in
            // ...
        }
        alertController.addAction(friend2Action)
        
        let friend3Action = UIAlertAction(title: "Call Mentor John", style: .default) { action in
            // ...
        }
        alertController.addAction(friend3Action)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            // ...
        }
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true){
        }
    }
    
    @IBAction func communityPressed(_ sender: Any) {
        
    }
    @IBAction func selfInspirationPressed(_ sender: Any) {
        
    }
    @IBAction func nevermindPressed(_ sender: Any) {
        
    }
}

