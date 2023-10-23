//
//  WeekendDay.swift
//  WallPaper
//
//  Created by MAC on 23/10/2023.
//

import Foundation

enum WeekendDay: Int {
    
    case monday = 0
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
        
    var nameDay: String {
        switch self {
        case .monday:
            return "Mon"
        case .tuesday:
            return "Tues"
        case .wednesday:
            return "Wed"
        case .thursday:
            return "thur"
        case .friday:
            return "Fri"
        case .saturday:
            return "Sat"
        case .sunday:
            return "Sun"
        }
    }
}

struct WeekendDayModel {
    
    var day: WeekendDay
    var isChecked = false
    
}
