import UIKit

class ProgressViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressCalendar(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "CalendarStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CalendarViewController") as! CalendarViewController
        self.show(vc, sender: self)
    }
    @IBAction func didPressNotes(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "NotesToSelfStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NotesSelfViewController") as! NotesSelfViewController
        self.show(vc, sender: self)
    }
    
}

