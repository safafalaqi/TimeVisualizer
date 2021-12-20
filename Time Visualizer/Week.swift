//
//  Week.swift
//  Time Visualizer
//
//  Created by Safa Falaqi on 18/12/2021.
//

import Foundation


struct Week {
    
    static var weekDays = [
        Day(name: Days.Sunday.rawValue),
        Day(name: Days.Monday.rawValue),
        Day(name: Days.Tuesday.rawValue),
        Day(name: Days.Wednesday.rawValue),
        Day(name: Days.Thursday.rawValue),
        Day(name: Days.Friday.rawValue),
        Day(name: Days.Saturday.rawValue)
    ]
}
struct Day{
    
    let name: String
    // in each day we have 48 cells
     var timeInDay:[Time] = [
                Time(time: "12:00 AM"),Time(time: "12:30 AM"),
                Time(time: "1:00 AM"),Time(time: "1:30 AM"),
                Time(time: "2:00 AM"),Time(time: "2:30 AM"),
                Time(time: "3:00 AM"),Time(time: "3:30 AM"),
                Time(time: "4:00 AM"),Time(time: "4:30 AM"),
                Time(time: "5:00 AM"),Time(time: "5:30 AM"),
                Time(time: "6:00 AM"),Time(time: "6:30 AM"),
                Time(time: "7:00 AM"),Time(time: "7:30 AM"),
                Time(time: "8:00 AM"),Time(time: "8:30 AM"),
                Time(time: "9:00 AM"),Time(time: "9:30 AM"),
                Time(time: "10:00 AM"),Time(time: "10:30 AM"),
                Time(time: "11:00 AM"),Time(time: "11:30 AM"),
                Time(time: "12:00 PM"),Time(time: "12:30 PM"),
                Time(time: "1:00 PM"),Time(time: "1:30 PM"),
                Time(time: "2:00 PM"),Time(time: "2:30 PM"),
                Time(time: "3:00 PM"),Time(time: "3:30 PM"),
                Time(time: "4:00 PM"),Time(time: "4:30 PM"),
                Time(time: "5:00 PM"),Time(time: "5:30 PM"),
                Time(time: "6:00 PM"),Time(time: "6:30 PM"),
                Time(time: "7:00 PM"),Time(time: "7:30 PM"),
                Time(time: "8:00 PM"),Time(time: "8:30 PM"),
                Time(time: "9:00 PM"),Time(time: "9:30 PM"),
                Time(time: "10:00 PM"),Time(time: "10:30 PM"),
                Time(time: "11:00 PM"),Time(time: "11:30 PM")
                ]
                                
}

struct Time{
    let time:String
    var note = ""
}

    

enum Days:String{
    case Sunday = "Sunday",Monday = "Monday",Tuesday = "Tuesday",Wednesday = "Wednesday",Thursday = "Thursday",Friday = "Friday",Saturday = "Saturday"
}
