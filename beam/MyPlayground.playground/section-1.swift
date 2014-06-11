// Playground - noun: a place where people can play

import UIKit
func getCurrentDateAndTime(add:Double) -> (date: String, time: String) {
    
    let date = NSDate(timeIntervalSinceNow: 3600 * add)
    
    //Formatter for time
    let formatterTime = NSDateFormatter()
    formatterTime.timeStyle = .ShortStyle //Set style of time
    var timeString = formatterTime.stringFromDate(date) //Convert to String
    
    
    //Formatter for date
    let formatterDate = NSDateFormatter()
    formatterDate.dateStyle = .ShortStyle //Set style of date
    var dateString = formatterDate.stringFromDate(date) //Convert to String
    
    return (dateString, timeString) //Returns a Tuple type
    
}

var test = getCurrentDateAndTime(-7.6)
test.date
test.time