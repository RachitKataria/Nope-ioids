import UIKit

class HomeScreenViewController: UIViewController {
    
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
        let storyboard: UIStoryboard = UIStoryboard(name: "BreatheStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "BreatheViewController") as! BreatheViewController
        self.show(vc, sender: self)
    }
    
    @IBAction func SeeProgressButtonPressed(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "CalendarStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CalendarViewController") as! CalendarViewController
        self.show(vc, sender: self)
    }
}
