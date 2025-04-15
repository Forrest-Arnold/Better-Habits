//
//  HabitVM.swift
//  Better-Habits
//
//  Created by Forrest Kalani Arnold on 4/13/25.
//

import Foundation
import SwiftUI

class HabitVM: ObservableObject {
    @Published var habitColor = Color.red
    
    @Published var myHabits = [""]
    
    var days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    var daysShorter = ["Su", "M", "T", "W", "Th", "F", "S"]
    
    var fitnessHabits = [
        Habit(name: "Exercise", color: Color.random()),
        Habit(name: "Run", color: Color.random()),
        Habit(name: "Cardio", color: Color.random()),
        Habit(name: "Lift Weights", color: Color.random()),
        Habit(name: "Work Out", color: Color.random())
    ]
    
    var healthHabits = [
        Habit(name: "Drink Water", color: Color.random()),
        Habit(name: "Wake Up Early", color: Color.random()),
        Habit(name: "Sleep Early", color: Color.random()),
        Habit(name: "Cook", color: Color.random()),
        Habit(name: "Brush Teeth", color: Color.random())
    ]
    
    var mindHabits = [
        Habit(name: "Read", color: Color.random()),
        Habit(name: "Study", color: Color.random()),
        Habit(name: "Learn", color: Color.random()),
        Habit(name: "Meditate", color: Color.random()),
        Habit(name: "Practice Language", color: Color.random()),
        Habit(name: "Journal", color: Color.random())
    ]
    
    var choresHabits = [
        Habit(name: "Clean", color: Color.random()),
        Habit(name: "Wash Dishes", color: Color.random()),
        Habit(name: "Laundry", color: Color.random()),
        Habit(name: "Vacuum", color: Color.random()),
        Habit(name: "Dust", color: Color.random()),
        Habit(name: "Make Bed", color: Color.random()),
        Habit(name: "Grocery Shop", color: Color.random())
    ]
    
    var reduceHabits = [
        Habit(name: "Less Smoking", color: Color.random()),
        Habit(name: "Less Drinking", color: Color.random()),
        Habit(name: "Less Social Media", color: Color.random()),
        Habit(name: "Less TV", color: Color.random())
    ]
    
    var allHabits = [Habit]()
    
    // Initialize and combine all habits
    init() {
        allHabits = fitnessHabits + healthHabits + mindHabits + choresHabits + reduceHabits
    }
}

extension Color {
    // Generate a random color
    static func random() -> Color {
        return Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
    }
}
