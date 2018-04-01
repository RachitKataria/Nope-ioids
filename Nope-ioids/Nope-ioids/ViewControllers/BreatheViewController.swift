import UIKit

class BreatheViewController: UIViewController {
    
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var BreatheImageView: UIImageView!
    @IBOutlet weak var BreatheLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let breatheGif = UIImage.gifImageWithName("breathe")
        BreatheImageView.image = breatheGif
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5){
            self.BreatheLabel.text = "Breathe out..."
        }
        
        NextButton.isHidden = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) { // change 2 to desired number of seconds
            // Your code with delay
            self.BreatheLabel.isHidden = true
            self.NextButton.isHidden = false
        }
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "HomeScreenStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeScreenViewController") as! HomeScreenViewController
        self.show(vc, sender: self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onNextButtonPress(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "HelpStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HelpViewController") as! HelpViewController
        self.show(vc, sender: self)
    }
}

