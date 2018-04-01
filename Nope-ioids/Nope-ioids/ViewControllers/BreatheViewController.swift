import UIKit

class BreatheViewController: UIViewController {
    
    @IBOutlet weak var NextButton: UIButton!
    @IBOutlet weak var BreatheImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let breatheGif = UIImage.gifImageWithName("breathe")
        BreatheImageView.image = breatheGif
        
        NextButton.isHidden = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) { // change 2 to desired number of seconds
            // Your code with delay
            self.NextButton.isHidden = false
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onNextButtonPress(_ sender: Any) {
        print("hello world")
    }
}

