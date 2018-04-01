import UIKit

class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var trackProgressButton: UIButton!
    @IBOutlet weak var StrongerCircle: UIImageView!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var DayLabel: UILabel!
    @IBOutlet weak var WeekdayLabel: UILabel!
    @IBOutlet weak var HelpStayStrongButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        DateLabel.font = UIFont(name: ".SFUIText-Medium", size: 12)!
        DayLabel.font = UIFont(name: ".SFUIText-Medium", size: 12)!
        WeekdayLabel.font = UIFont(name: ".SFUIText-Medium", size: 12)!
        HelpStayStrongButton.layer.cornerRadius = 0.5 * HelpStayStrongButton.bounds.size.width
        HelpStayStrongButton.clipsToBounds = true
        HelpStayStrongButton.titleLabel?.font = UIFont(name: ".SFUIText-Medium", size: 18)!
        trackProgressButton.titleLabel?.font = UIFont(name: ".SFUIText-Medium", size: 18)!
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func HelpButtonPressed(_ sender: Any) {
        UIView.animate(withDuration: 1.5, animations: {
            self.StrongerCircle.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        })
        { (finished) in
            let storyboard: UIStoryboard = UIStoryboard(name: "BreatheStoryboard", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "BreatheViewController") as! BreatheViewController
            self.present(vc, animated: false, completion: nil)
        }
        
    }
    
    @IBAction func SeeProgressButtonPressed(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ProgressStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ProgressViewController") as! ProgressViewController
        self.show(vc, sender: self)
    }
}
class FadeSegue: UIStoryboardSegue {
    override func perform() {
        // Get the view of the source
        let sourceViewControllerView = self.source.view
        // Get the view of the destination
        let destinationViewControllerView = self.destination.view
        
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        
        // Make the destination view the size of the screen
        destinationViewControllerView?.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        
        // Insert destination below the source
        // Without this line the animation works but the transition is not smooth as it jumps from white to the new view controller
        destinationViewControllerView?.alpha = 0;
        sourceViewControllerView?.addSubview(destinationViewControllerView!);
        // Animate the fade, remove the destination view on completion and present the full view controller
        UIView.animate(withDuration: 10, animations: {
            destinationViewControllerView?.alpha = 1;
        }, completion: { (finished) in
            destinationViewControllerView?.removeFromSuperview()
            self.source.present(self.destination, animated: false, completion: nil)
        })
    }
}

