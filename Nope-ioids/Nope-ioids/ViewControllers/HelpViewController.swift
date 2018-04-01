import UIKit

class HelpViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "HomeStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! ProgressViewController
        self.show(vc, sender: self)
    }
    
    @IBAction func callFriendPressed(_ sender: Any) {
        let alertController = UIAlertController(title: nil, message: "Choose a friend to call", preferredStyle: .actionSheet)
        
        let friend1Action = UIAlertAction(title: "Call Mom", style: .default) { action in
            let phoneNumber1 = "3528712319"
            let number = phoneNumber1.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
            UIApplication.shared.open(URL(string: "tel://" + number)!, options: [:], completionHandler: nil)
        }
        alertController.addAction(friend1Action)
        
        let friend2Action = UIAlertAction(title: "Call Stacey", style: .default) { action in
            let phoneNumber2 = "4082181005"
            let number = phoneNumber2.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
            UIApplication.shared.open(URL(string: "tel://" + number)!, options: [:], completionHandler: nil)
        }
        alertController.addAction(friend2Action)
        
        let friend3Action = UIAlertAction(title: "Call Mentor John", style: .default) { action in
            let phoneNumber3 = "4084558851"
            let number = phoneNumber3.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
            UIApplication.shared.open(URL(string: "tel://" + number)!, options: [:], completionHandler: nil)
        }
        alertController.addAction(friend3Action)
        
        let hotlineAction = UIAlertAction(title: "Call Hotline (Anonymous)", style: .default) { action in
            let phoneNumber4 = "18006624357" //National Opioid Hotline
            let number = phoneNumber4.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
            UIApplication.shared.open(URL(string: "tel://" + number)!, options: [:], completionHandler: nil)
        }
        alertController.addAction(hotlineAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in
            //Drop the view
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

