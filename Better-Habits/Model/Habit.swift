//
//  Habit.swift
//  Better-Habit
//
//  Created by Forrest Kalani Arnold on 4/12/25.
//

import Foundation
import SwiftUI

class Habit: Identifiable, ObservableObject, Hashable {
    var id = UUID()
    var name: String
    var color: Color
    var leastMost = "At Least"
    var time = "times"
    var timeNumber = 3
    var day = "Week"
    var scheduleDays = [""]
    var scheduleHour = 1
    var scheduleMinute = 0
    var scheduleAmPm = 0
    var streak = 0
    
    init(name: String, color: Color) {
        self.name = name
        self.color = color
    }
    
    static func == (lhs: Habit, rhs: Habit) -> Bool {
        return lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var textColor: Color {
        color.isVeryDark ? .white : .black
    }
}




