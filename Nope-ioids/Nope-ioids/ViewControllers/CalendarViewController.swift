//
//  CalendarViewController.swift
//  Nope-ioids
//
//  Created by Rachit Kataria on 3/31/18.
//  Copyright © 2018 Rachit Kataria. All rights reserved.
//

import UIKit
import FSCalendar
import SwiftChart

class CalendarViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate, FSCalendarDelegateAppearance {
    
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var streakChart: Chart!
    
    var streakDates: [Date]!
    var chartData: [(Int, Double)]!
    
    @IBAction func backButtonPressed(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ProgressStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ProgressViewController") as! ProgressViewController
        self.show(vc, sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(calendar.currentPage)
        calendar.allowsSelection = false
        
        // Setup chart
        setupChart()
        
        // Create previous streak
        setupCalendar()
   
    }
    
    func setupCalendar() {
        streakDates = []
        
        var dateComponents = DateComponents()
        dateComponents.year = 2017
        let userCalendar = Calendar.current // user calendar
        var randomStreak: Int!

        for monthIndex in 0...chartData.count - 1 {
            dateComponents.month = 8 + monthIndex
            
            if(dateComponents.month! > 12) {
                dateComponents.month! -= 12
                dateComponents.year = 2018
            }
            
            dateComponents.day = 1
            let firstTime = userCalendar.date(from: dateComponents)
            
            for _ in 0...Int(chartData[monthIndex].1) {
                randomStreak = Int(arc4random_uniform(27))
                let time = Calendar.current.date(byAdding: .day, value: randomStreak, to: firstTime!)!
                streakDates.append(time)
            }
        }
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
            return UIColor.init(red: 31/255.0, green: 119/255.0, blue: 219/255.0, alpha: 1)
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
    
    func setupChart() {
        chartData = [
            (x: 1, y: 5.0),
            (x: 2, y: 6.0),
            (x: 3, y: 4.0),
            (x: 4, y: 8.0),
            (x: 5, y: 10.0),
            (x: 6, y: 4.0),
            (x: 7, y: 14.0),
            (x: 8, y: 22.0),
        ]
        
        let series = ChartSeries.init(data: chartData)
        streakChart.add(series)
    }
}

