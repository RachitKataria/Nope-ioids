import UIKit

class BreatheViewController: UIViewController {
    
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var BreatheImageView: UIImageView!
    @IBOutlet weak var BreatheLabel: UILabel!
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var HeyLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        BreatheLabel.isOpaque = false
        BreatheLabel.alpha = 0.0
        NextButton.titleLabel?.isOpaque = false
        NextButton.titleLabel?.alpha = 0.0
        HeyLabel.isOpaque = false
        HeyLabel.alpha = 0.0
        BackButton.isOpaque = false
        BackButton.alpha = 0.0
        
        
        let breatheGif = UIImage.gifImageWithName("breathe")
        BreatheImageView.image = breatheGif
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.5){
            self.BreatheLabel.text = "Breathe out..."
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
             UIView.animate(withDuration: 1.5, animations: {
             self.BreatheLabel.alpha = 1.0
             self.NextButton.alpha = 1.0
             self.HeyLabel.alpha = 1.0
             self.BackButton.alpha = 1.0
             }, completion: nil)
        }
        
        NextButton.isUserInteractionEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) { // change 2 to desired number of seconds
            // Your code with delay
            UIView.animate(withDuration: 0.5, animations:{
                self.BreatheLabel.alpha = 0.0
                self.NextButton.titleLabel?.alpha = 1.0
                self.NextButton.isUserInteractionEnabled = true
            })
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

