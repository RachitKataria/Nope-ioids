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
    }
    
    @IBAction func SeeProgressButtonPressed(_ sender: Any) {
        
    }
}
