import UIKit

class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var StrongerCircle: UIImageView!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var DayLabel: UILabel!
    @IBOutlet weak var WeekdayLabel: UILabel!
    @IBOutlet weak var HelpStayStrongButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        HelpStayStrongButton.layer.cornerRadius = 0.5 * HelpStayStrongButton.bounds.size.width
        HelpStayStrongButton.clipsToBounds = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func HelpButtonPressed(_ sender: Any) {
        UIView.animate(withDuration: 1.5, animations: {
            self.StrongerCircle.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        })
/*
        let storyboard: UIStoryboard = UIStoryboard(name: "BreatheStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BreatheViewController") as! BreatheViewController
        self.show(vc, sender: self)*/
    }
    
    @IBAction func SeeProgressButtonPressed(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ProgressStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ProgressViewController") as! ProgressViewController
        self.show(vc, sender: self)
    }
}
