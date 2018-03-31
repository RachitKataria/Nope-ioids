import UIKit

class BreatheViewController: UIViewController {
    
    @IBOutlet weak var BreatheImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let breatheGif = UIImage.gifImageWithName("breathe")
        BreatheImageView.image = breatheGif
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

