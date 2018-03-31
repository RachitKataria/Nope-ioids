//
//  CalendarViewController.swift
//  Nope-ioids
//
//  Created by Rachit Kataria on 3/31/18.
//  Copyright © 2018 Rachit Kataria. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance {
    
    @IBOutlet weak var calendar: FSCalendar!
    
    var streakDates: [Date]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(calendar.currentPage)
        
        // Init
        streakDates = []
        streakDates.append(Calendar.current.date(byAdding: .day, value: -1, to: Date())!)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Select streaks on calendar
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillDefaultColorFor date: Date) -> UIColor? {
        
        for d in streakDates {
            if(isSameDate(date: date, compareTo: d)) {
                return UIColor.green
            }
        }
        
        if(!isSameDate(date: date, compareTo: Date())) {
            return UIColor.clear
        } else {
            return UIColor.init(red: 198/255.0, green: 51/255.0, blue: 42/255.0, alpha: 1)
        }
    }
    
    // Check if same date
    func isSameDate(date: Date, compareTo secondDate: Date) -> Bool {
        let calendar = Calendar.current
        let firstMonth = calendar.component(.month, from: date)
        let firstDay = calendar.component(.day, from: date)
        let firstYear = calendar.component(.year, from: date)
        
        let secondMonth = calendar.component(.month, from: secondDate)
        let secondDay = calendar.component(.day, from: secondDate)
        let secondYear = calendar.component(.year, from: secondDate)
        
        return firstMonth == secondMonth && firstDay == secondDay && firstYear == secondYear;
    }
}

